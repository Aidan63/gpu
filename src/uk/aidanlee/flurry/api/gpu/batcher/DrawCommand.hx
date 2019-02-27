package uk.aidanlee.flurry.api.gpu.batcher;

import uk.aidanlee.flurry.api.resources.Resource.ImageResource;
import uk.aidanlee.flurry.api.resources.Resource.ShaderResource;
import uk.aidanlee.flurry.api.gpu.geometry.Blending.BlendMode;
import uk.aidanlee.flurry.api.gpu.geometry.Geometry.PrimitiveType;
import uk.aidanlee.flurry.api.maths.Rectangle;
import uk.aidanlee.flurry.api.maths.Matrix;

/**
 * A draw command describes how to draw a set amount of data within a vertex buffer.
 * These commands contain the buffer range, shader, texture, viewport, etc.
 */
class DrawCommand
{
    /**
     * Hash ID for this draw command.
     * 
     * Generated by hashing the concatenated string of all the included geometries names
     */
    public final id : Int;

    /**
     * If this draw command is unchanging.
     */
    public final unchanging : Bool;

    /**
     * Projection matrix to draw this command with.
     */
    public final projection : Matrix;

    /**
     * View matrix to draw this command with.
     */
    public final view : Matrix;

    /**
     * Number of vertices in this draw command.
     */
    public final vertices : Int;

    /**
     * Number of indices in this draw command.
     */
    public final indices : Int;

    /**
     * Viewport for this draw command.
     */
    public final viewport : Rectangle;

    /**
     * Primitive type of this draw command.
     */
    public final primitive : PrimitiveType;

    /**
     * The render target for this draw command.
     */
    public final target : ImageResource;

    /**
     * Shader to be used to draw this data.
     */
    public final shader : ShaderResource;

    /**
     * Textures (if any) to draw with this data.
     */
    public final textures : Array<ImageResource>;

    /**
     * Clipping rectangle.
     */
    public final clip : Rectangle;

    /**
     * If blending is enabled for this draw command.
     */
    public final blending : Bool;

    public final srcRGB : BlendMode;

    public final dstRGB : BlendMode;

    public final srcAlpha : BlendMode;

    public final dstAlpha : BlendMode;

    inline public function new(
        _id         : Int,
        _unchanging : Bool,
        _projection : Matrix,
        _view       : Matrix,
        _vertices   : Int,
        _indices    : Int,
        _viewport   : Rectangle,
        _primitive  : PrimitiveType,
        _target     : ImageResource,
        _shader     : ShaderResource,
        _textures   : Array<ImageResource>,
        _clip       : Rectangle,
        _blending   : Bool,
        _srcRGB     : BlendMode = null,
        _dstRGB     : BlendMode = null,
        _srcAlpha   : BlendMode = null,
        _dstAlpha   : BlendMode = null
    )
    {
        id = _id;

        unchanging = _unchanging;
        projection = _projection;
        view       = _view;
        vertices   = _vertices;
        indices    = _indices;

        viewport  = _viewport;
        primitive = _primitive;
        target    = _target;
        shader    = _shader;
        textures  = _textures;
        clip      = _clip;
        blending  = _blending;
        srcRGB    = _srcRGB;
        dstRGB    = _dstRGB;
        srcAlpha  = _srcAlpha;
        dstAlpha  = _dstAlpha;
    }
}