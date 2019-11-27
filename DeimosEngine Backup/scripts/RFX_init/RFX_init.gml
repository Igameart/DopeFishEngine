/// @description RFX_init(pixel width, dither texture, dither spread, double wide pixels)
/// @param pixel width
/// @param  dither texture
/// @param  dither spread
/// @param  double wide pixels

globalvar RFXshader,RFXscale,RFXdith,RFXspread,RFXbdepth,RFXpal,
    RFXudepth,RFXdithsampler,RFXpalsampler,RFXscreensize,RFXdithdiv,RFX2wide,RFXenabled,RFXcdepth,RFXuspread,RFXuPixelScale,RFXPixelScale;

RFXshader = 0;
RFXscale = argument0;
RFXdith = argument1;
RFXspread = argument2;
RFXcdepth = 10;
RFXpal = 0;
RFXdithsampler = 0;
RFXpalsampler = 0;
RFXscreensize = 0;
RFXuspread = 0;
RFXudepth = 0;
RFXenabled = true;
RFX2wide = argument3;
RFXPixelScale = [RFX2wide? argument0*2: argument0, argument0];
