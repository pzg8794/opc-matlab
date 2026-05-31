
#include <stdlib.h>
#include <math.h>

#include "image.h"
#include "sys.h"

#define YRADIUS 1
#define XRADIUS 3

#define round(x) (int)floor((x)+0.5)
#define DPI 72
#define E round(2.5*DPI)
#define MU (1.0/3.0)
#define separation(z) round((1-MU*z)*E/(2-MU*z))
#define NEAR separation(1)
#define FAR separation(0)

#define _NEAR 25
#define _FAR 150

#define _E (2.0*_FAR)
#define _MU (2.0*(_NEAR-_FAR)/(_NEAR-2.0*_FAR))

#define depth(s) (2*s-_E)/(_MU*(s-_E))

int
main (int argc, char **argv)
{
    image_t *src;
    image_t *dst;
    float *depths;
    int w, h, c;
    int x, y, s;
    int i, j;
    int near, far;
    
    src = image_readpnm((argc > 1) ? argv[1] : NULL);
    w = src->width;
    h = src->height;
    c = src->components;
    if (c != 1 && c != 3)
	fatal("Error: input image not color or greyscale\n");
    dst = image_alloc(w, h, 1);
    depths = allocate(w * h * sizeof(float));
    
    near = NEAR;
    far = FAR;
#if 1
    near = _NEAR;
    far = _FAR;
#endif
    
    warn("image is %d by %d by %d\n", w, h, c);
    warn("will search %d to %d\n", near, far);
    
    for (y = 0; y < h; y++) {
        if (y % 10 == 0)
	    warn("processing row %d\n", y);
        for (x = 0; x < w; x++) {
            int s_best = near;
            float d_best = 1e6;
            float z = 0;
            /* search for s */
            for (s = near; s <= far; s++) {
                float d = 0;
                int l = x - s/2;
                int r = l + s;
                if (l >= 0 && r < w) {
                    int bot = y - YRADIUS;
                    int top = y + YRADIUS;
                    int lrad = XRADIUS;
                    int rrad = XRADIUS;
                    int ls, rs;
                    int lrcount;
                    if (bot < 0) bot = 0;
                    if (top > h - 1) top = h - 1;
                    if (lrad > l) lrad = l;
                    if (rrad > w - 1 - r) rrad = w - 1 - r;
                    ls = l - lrad;
                    rs = r - lrad;
                    lrcount = (lrad + rrad + 1) * c;
                    for (j = bot; j <= top; j++) {
                        unsigned char *lp = &src->pixels[c*(j*w+ls)];
                        unsigned char *rp = &src->pixels[c*(j*w+rs)];
                        for (i = 0; i <= lrcount; i++) {
                            float diff = (*lp++-*rp++) / 255.0;
                            d += diff * diff;
                        }
                    }
                    d /= (top-bot+1)*lrcount;
                    if (d < d_best) {
                        s_best = s;
                        d_best = d;
                    }
                }
            }
            /* compute depth */
            z = depth(s_best);
            /* store it */
            depths[y*w+x] = z;
        }
    }
    
    /* create depth image */
    for (y = 0; y < h; y++) {
        for (x = 0; x < w; x++) {
            dst->pixels[y*w+x] = 255.9 * depths[y*w+x];
        }
    }
    image_writepnm(dst, (argc>2)?argv[2]:NULL);
    
    return 0;
}