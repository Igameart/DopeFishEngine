/*
 * "$Id: config.h 109 2003-12-24 10:38:34Z ajapted $"
 *
 * Configuration file for the Fast Light Tool Kit (FLTK).
 *
 * Copyright 1998-2003 by Bill Spitzak and others.
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Library General Public
 * License as published by the Free Software Foundation; either
 * version 2 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Library General Public License for more details.
 *
 * You should have received a copy of the GNU Library General Public
 * License along with this library; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307
 * USA.
 *
 * Please report all bugs and problems to "FLTK-bugs@fltk.org".
 */

/*
 * Where to find files...
 */

#define FLTK_DATADIR	"C:/FLTK"
#define FLTK_DOCDIR	"C:/FLTK/DOC"

/*
 * BORDER_WIDTH:
 *
 * Thickness of FL_UP_BOX and FL_DOWN_BOX.  Current 1,2, and 3 are
 * supported.
 *
 * 3 is the historic FLTK look.
 * 2 is the default and looks like Microsoft Windows, KDE, and Qt.
 * 1 is a plausible future evolution...
 *
 * Note that this may be simulated at runtime by redefining the boxtypes
 * using Fl::set_boxtype().
 */

#define BORDER_WIDTH 2

/*
 * HAVE_GL:
 *
 * Do you have OpenGL? Set this to 0 if you don't have or plan to use
 * OpenGL, and FLTK will be smaller.
 *
 * In order to set to 1 you will need to obtain the OpenGL header and
 * library files.  Consult the README.win32 file for further details.
 */

#define HAVE_GL 0

/*
 * HAVE_GL_GLU_H:
 *
 * Do you have the OpenGL Utility Library header file?
 * (many broken Mesa RPMs do not...)
 */

#define HAVE_GL_GLU_H 0

/*
 * USE_COLORMAP:
 *
 * Setting this to zero will save a good deal of code (especially for
 * fl_draw_image), but FLTK will only work on TrueColor visuals.
 */

#define USE_COLORMAP 1

/*
 * USE_XFT
 *
 * Use the new Xft library to draw anti-aliased text.
 */

#define USE_XFT 0

/*
 * HAVE_XDBE:
 *
 * Do we have the X double-buffer extension?
 */

#define HAVE_XDBE 0

/*
 * USE_XDBE:
 *
 * Actually try to use the double-buffer extension?  Set this to zero
 * disable use of XDBE without breaking the list_visuals program.
 */

#define USE_XDBE HAVE_XDBE

/*
 * HAVE_OVERLAY:
 *
 * Use the X overlay extension?  FLTK will try to use an overlay
 * visual for Fl_Overlay_Window, the Gl_Window overlay, and for the
 * menus.  Setting this to zero will remove a substantial amount of
 * code from FLTK.  Overlays have only been tested on SGI servers!
 */

#define HAVE_OVERLAY 0

/*
 * HAVE_GL_OVERLAY:
 *
 * It is possible your GL has an overlay even if X does not.  If so,
 * set this to 1.
 */

#define HAVE_GL_OVERLAY HAVE_OVERLAY

/*
 * WORDS_BIGENDIAN:
 *
 * Byte order of your machine: 1 = big-endian, 0 = little-endian.
 */

#define WORDS_BIGENDIAN 0

/*
 * U16, U32, U64:
 *
 * Types used by fl_draw_image.  One of U32 or U64 must be defined.
 * U16 is optional but FLTK will work better with it!
 */

#define U16 unsigned short
#define U32 unsigned
/* #undef U64 */

/*
 * HAVE_DIRENT_H, HAVE_SYS_NDIR_H, HAVE_SYS_DIR_H, HAVE_NDIR_H, HAVE_SCANDIR:
 *
 * Where is <dirent.h> (used only by fl_file_chooser and scandir).
 */

#define HAVE_DIRENT_H 1
/* #undef HAVE_SYS_NDIR_H */
/* #undef HAVE_SYS_DIR_H */
/* #undef HAVE_NDIR_H */
/* #undef HAVE_SCANDIR */

/*
 * Possibly missing sprintf-style functions:
 */

/* #undef HAVE_VSNPRINTF */
/* #undef HAVE_SNPRINTF */

/*
 * String functions...
 */

/* #undef HAVE_STRINGS_H */
#define HAVE_STRCASECMP 1
/* #undef HAVE_STRLCAT */
/* #undef HAVE_STRLCPY */

/*
 * HAVE_SYS_SELECT_H:
 *
 * Whether or not select() call has its own header file.
 */

/* #undef HAVE_SYS_SELECT_H */

/*
 * USE_POLL:
 *
 * Use poll() if we don't have select().
 */

#define USE_POLL 0

/*
 * Do we have various image libraries?
 */

/* #undef HAVE_LIBPNG */
/* #undef HAVE_LIBZ */
/* #undef HAVE_LIBJPEG */

/*
 * Which header file do we include for libpng?
 */

/* #undef HAVE_PNG_H */
/* #undef HAVE_LIBPNG_PNG_H */

/*
 * Do we have the png_xyz() functions?
 */

/* #undef HAVE_PNG_GET_VALID */
/* #undef HAVE_PNG_SET_TRNS_TO_ALPHA */

/*
 * Do we have POSIX threading?
 */

/* #undef HAVE_PTHREAD */
/* #undef HAVE_PTHREAD_H */


/*
 * End of "$Id: config.h 109 2003-12-24 10:38:34Z ajapted $".
 */
