
#include <assert.h>
#include <stdio.h>

#include "sys.h"
#include "image.h"

image_t *
image_alloc (int width, int height, int components)
{
    image_t *image = (image_t *)allocate(sizeof(image_t));
    
    assert(components >= 1 && components <= 4);
    
    image->width = width;
    image->height = height;
    image->components = components;
    image->pixels = (unsigned char *)allocate(width * height * components);
    
    return image;
}

void
image_free (image_t *image)
{
    deallocate(image->pixels);
    deallocate(image);
}

image_t *
image_readpnm (char *name)
{
    FILE *file;
    char magic[2], c;
    int max;
    int w, h, n, b, x, y, z;
    image_t *image;
    
    if (name) {
        if (!(file = fopen(name, "rb")))
	    fatal("%s: couldn't open for reading\n", name);
    }
    else {
        name = "stdin";
        file = stdin;
    }
    
    if (fscanf(file, "%c%c\n", &magic[0], &magic[1]) != 2)
	fatal("%s: bad magic number\n", name);
    
    if (magic[0] != 'P')
	fatal("%s: not a recognized pnm format\n", name);
    
    switch (magic[1]) {
        case '4': n = 1; b = 1; break;
        case '5': n = 1; b = 0; break;
        case '6': n = 3; b = 0; break;
        case '7': n = 2; b = 0; break;
        case '8': n = 4; b = 0; break;
        default:
        fatal("%s: not a recognized pnm format\n", name);
    }
    
    while ((c = getc(file)) == '#')
	fscanf(file, "%*[^\n]\n");
    
    ungetc(c, file);
    
    if (!b) {
        if (fscanf(file, "%d%d%d%c", &w, &h, &max, &c) != 4)
	    fatal("%s: bad pnm header\n", name);
    }
    else {
        if (fscanf(file, "%d%d%c", &w, &h, &c) != 3)
	    fatal("%s: bad pnm header\n", name);
        max = 255;
    }
    
    if (w <= 0 || h <= 0)
	fatal("%s: bad image size\n", name);
    
    if (max < 1 || max > 255)
	fatal("%s: bad image max\n", name);
    
    image = image_alloc(w, h, n);
    
    if (!b) {
        for (y = h - 1; y >= 0; y--)
	    if (fread(&image->pixels[y * w * n], w, n, file) != n)
		fatal("%s: unexpected end of file\n", name);
    }
    else {
        unsigned char *buf = (unsigned char *)allocate((w + 7) / 8);
        for (y = h - 1; y >= 0; y--) {
            if (fread(buf, (w + 7) / 8, 1, file) != 1)
            fatal("%s: unexpected end of file\n", name);
            for (x = 0; x < w; x++) {
                unsigned char val = (buf[x / 8] & (0x80 >> (x % 8))) ? 0 : 255;
                image->pixels[y * w + x] = val;
            }
        }
        deallocate(buf);
    }
    
    if (max != 255) {
        float s = 255.99f / max;
        for (y = 0; y < h; y++) {
            for (x = 0; x < w; x++) {
                for (z = 0; z < n; z++) {
                    image->pixels[(y * w + x) * n + z] *= s;
                }
            }
        }
    }
    
    fclose(file);
    
    return image;
}

void
image_writepnm (image_t *image, char *name)
{
    int w = image->width;
    int h = image->height;
    int n = image->components;
    int c;
    int y;
    FILE *file;
    
    if (name) {
        if (!(file = fopen(name, "wb")))
	    fatal("%s: couldn't open for writing\n");
    }
    else {
        name = "stdout";
        file = stdout;
    }
    
    c = (n == 1) ? '5' : (n == 2) ? '7' : (n == 3) ? '6' : '8';
    
    fprintf(file, "P%c\n%d %d\n%d\n", c, w, h, 255);
    
    for (y = h - 1; y >= 0; y--)
	fwrite(&image->pixels[y * w * n], w, n, file);
    
    fclose(file);
}