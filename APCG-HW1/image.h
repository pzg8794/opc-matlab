#ifndef IMAGE_H_INCLUDED
#define IMAGE_H_INCLUDED

typedef struct {
    int width;
    int height;
    int components;
    unsigned char *pixels;
} image_t;

extern image_t *image_alloc (int width, int height, int components);
extern void image_free (image_t *image);

extern image_t *image_readpnm (char *name);
extern void image_writepnm (image_t *image, char *name);

#endif /* IMAGE_H_INCLUDED */