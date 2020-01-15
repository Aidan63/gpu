package uk.aidanlee.flurry.api.gpu.batcher;

import uk.aidanlee.flurry.api.maths.Rectangle;
import uk.aidanlee.flurry.api.gpu.BlendMode;
import uk.aidanlee.flurry.api.gpu.DepthOptions;
import uk.aidanlee.flurry.api.gpu.PrimitiveType;
import uk.aidanlee.flurry.api.gpu.StencilOptions;
import uk.aidanlee.flurry.api.gpu.shader.Uniforms;
import uk.aidanlee.flurry.api.gpu.camera.Camera;
import uk.aidanlee.flurry.api.gpu.textures.SamplerState;
import uk.aidanlee.flurry.api.resources.Resource.ImageResource;
import uk.aidanlee.flurry.api.resources.Resource.ShaderResource;

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
     * Provides a hint to the backend on how to upload the vertex data.
     */
    public final uploadType : UploadType;

    /**
     * Projection matrix to draw this command with.
     */
    public final camera : Camera;

    /**
     * Screen space region this draw will be clipped to.
     */
    public final clip : Null<Rectangle>;

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
     * If provided uniform values are fetch from here before the shader defaults.
     */
    public final uniforms : Uniforms;

    /**
     * Textures (if any) to draw with this data.
     */
    public final textures : Array<ImageResource>;

    public final samplers : Array<Null<SamplerState>>;

    public final depth : DepthOptions;

    public final stencil : StencilOptions;

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
        _uploadType : UploadType,
        _camera     : Camera,
        _clip       : Null<Rectangle>,
        _primitive  : PrimitiveType,
        _target     : ImageResource,
        _shader     : ShaderResource,
        _uniforms   : Uniforms,
        _textures   : Array<ImageResource>,
        _samplers   : Array<Null<SamplerState>>,
        _depth      : DepthOptions,
        _stencil    : StencilOptions,
        _blending   : Bool,
        _srcRGB     : BlendMode = null,
        _dstRGB     : BlendMode = null,
        _srcAlpha   : BlendMode = null,
        _dstAlpha   : BlendMode = null
    )
    {
        id         = _id;
        uploadType = _uploadType;
        camera     = _camera;
        clip       = _clip;
        primitive  = _primitive;
        target     = _target;
        shader     = _shader;
        uniforms   = _uniforms;
        textures   = _textures;
        samplers   = _samplers;
        depth      = _depth;
        stencil    = _stencil;
        blending   = _blending;
        srcRGB     = _srcRGB;
        dstRGB     = _dstRGB;
        srcAlpha   = _srcAlpha;
        dstAlpha   = _dstAlpha;
    }
}
