package;

import uk.aidanlee.flurry.Flurry;
import uk.aidanlee.flurry.FlurryConfig;
import uk.aidanlee.flurry.api.gpu.camera.Camera2D;
import uk.aidanlee.flurry.api.gpu.geometry.shapes.QuadGeometry;
import uk.aidanlee.flurry.api.resources.Resource.ImageResource;
import uk.aidanlee.flurry.api.resources.Resource.ShaderResource;

class BatcherDepth extends Flurry
{
    override function onConfig(_config : FlurryConfig) : FlurryConfig
    {
        _config.window.title  = 'System Tests';
        _config.window.width  = 768;
        _config.window.height = 512;

        _config.resources.preload = PrePackaged('preload');

        return _config;
    }

    override function onReady()
    {
        final camera   = new Camera2D(display.width, display.height);
        final batcher1 = renderer.createBatcher({ shader : resources.get('textured', ShaderResource), camera : camera, depth : 1 });
        final batcher2 = renderer.createBatcher({ shader : resources.get('textured', ShaderResource), camera : camera, depth : 0 });
        final batcher3 = renderer.createBatcher({ shader : resources.get('textured', ShaderResource), camera : camera, depth : 2 });

        new QuadGeometry({
            textures : Textures([ resources.get('tank1', ImageResource) ]),
            batchers : [ batcher1 ],
            x : 192, y : 64, w : 256, h : 256
        });
        new QuadGeometry({
            textures : Textures([ resources.get('tank2', ImageResource) ]),
            batchers : [ batcher2 ],
            x : 256, y : 128, w : 256, h : 256
        });
        new QuadGeometry({
            textures : Textures([ resources.get('tank3', ImageResource) ]),
            batchers : [ batcher3 ],
            x : 320, y : 192, w : 256, h : 256
        });
    }
}
