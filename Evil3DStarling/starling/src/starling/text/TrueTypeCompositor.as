// =================================================================================================
//
//	Starling Framework
//	Copyright Gamua GmbH. All Rights Reserved.
//
//	This program is free software. You can redistribute and/or modify it
//	in accordance with the terms of the accompanying license agreement.
//
// =================================================================================================

package starling.text
{
    import flash.display.BitmapData;
    import flash.geom.Matrix;
    import flash.text.AntiAliasType;
    import flash.text.TextField;
    
    import starling.display.MeshBatch;
    import starling.display.Quad;
    import starling.textures.IStarlingTexture;
    import starling.textures.TextureFactory;
    import starling.textures.TextureHelper;
    import starling.utils.Align;
    import starling.utils.SystemUtil;

    /** This text compositor uses a Flash TextField to render system- or embedded fonts into
     *  a texture.
     *
     *  <p>You typically don't have to instantiate this class. It will be used internally by
     *  Starling's text fields.</p>
     */
    public class TrueTypeCompositor implements ITextCompositor
    {
        // helpers
        private static var sHelperMatrix:Matrix = new Matrix();
        private static var sHelperQuad:Quad = new Quad(100, 100);
        private static var sNativeTextField:flash.text.TextField = new flash.text.TextField();
        private static var sNativeFormat:flash.text.TextFormat = new flash.text.TextFormat();

        /** Creates a new TrueTypeCompositor instance. */
        public function TrueTypeCompositor()
        { }

        /** @inheritDoc */
        public function fillMeshBatch(meshBatch:MeshBatch, width:Number, height:Number, text:String,
                                      format:TextFormat, options:TextOptions=null):void
        {
            if (text == null || text == "") return;

            var texture:IStarlingTexture;
            var textureFormat:String = options.textureFormat;
            var bitmapData:BitmapData = renderText(width, height, text, format, options);
            texture = TextureFactory.fromBitmapData(bitmapData, false, false, textureFormat);
			bitmapData = null;
			
            sHelperQuad.texture = texture;
            sHelperQuad.readjustSize();

            if (format.horizontalAlign == Align.LEFT) sHelperQuad.x = 0;
            else if (format.horizontalAlign == Align.CENTER) sHelperQuad.x = int((width - texture.width) / 2);
            else sHelperQuad.x = width - texture.width;

            if (format.verticalAlign == Align.TOP) sHelperQuad.y = 0;
            else if (format.verticalAlign == Align.CENTER) sHelperQuad.y = int((height - texture.height) / 2);
            else sHelperQuad.y = height - texture.height;

			sHelperQuad.setupVerticesImmediately();
            meshBatch.addMesh(sHelperQuad);

            sHelperQuad.texture = null;
        }

        /** @inheritDoc */
        public function clearMeshBatch(meshBatch:MeshBatch):void
        {
            meshBatch.clear();
            if (meshBatch.texture) meshBatch.texture.dispose();
        }

        private function renderText(width:Number, height:Number, text:String,
                                    format:TextFormat, options:TextOptions):BitmapData
        {
            var hAlign:String = format.horizontalAlign;

            format.toNativeFormat(sNativeFormat);

            sNativeFormat.size = Number(sNativeFormat.size);
            sNativeTextField.embedFonts = SystemUtil.isEmbeddedFont(format.font, format.bold, format.italic);
            sNativeTextField.defaultTextFormat = sNativeFormat;
            sNativeTextField.width  = width;
            sNativeTextField.height = height;
            sNativeTextField.antiAliasType = AntiAliasType.ADVANCED;
            sNativeTextField.selectable = false;
            sNativeTextField.multiline = true;
            sNativeTextField.wordWrap = options.wordWrap;

            if (options.isHtmlText) sNativeTextField.htmlText = text;
            else                    sNativeTextField.text     = text;

            if (options.autoScale)
                autoScaleNativeTextField(sNativeTextField, text, options.isHtmlText);

            var textWidth:Number  = sNativeTextField.textWidth;
            var textHeight:Number = sNativeTextField.textHeight;
            var bitmapWidth:int   = Math.ceil(textWidth)  + 4;
            var bitmapHeight:int  = Math.ceil(textHeight) + 4;
            var maxTextureSize:int = TextureHelper.maxSize;
            var minTextureSize:int = 1;
            var offsetX:Number = 0.0;

            // HTML text may have its own alignment -> use the complete width
            if (options.isHtmlText) textWidth = bitmapWidth = width;

            // check for invalid texture sizes
            if (bitmapWidth  < minTextureSize) bitmapWidth  = 1;
            if (bitmapHeight < minTextureSize) bitmapHeight = 1;
            if (bitmapHeight > maxTextureSize || bitmapWidth > maxTextureSize)
            {
                return renderText(width, height, text, format, options);
            }
            else
            {
                if (!options.isHtmlText)
                {
                    if      (hAlign == Align.RIGHT)  offsetX =  width - textWidth - 4;
                    else if (hAlign == Align.CENTER) offsetX = (width - textWidth - 4) / 2.0;
                }

                // finally: draw TextField to bitmap data
                var bitmapData:BitmapData = new BitmapData(bitmapWidth, bitmapHeight,true,0);
                sHelperMatrix.setTo(1, 0, 0, 1, -offsetX, 0);
                bitmapData.draw(sNativeTextField, sHelperMatrix);
                sNativeTextField.text = "";
                return bitmapData;
            }
        }

        private function autoScaleNativeTextField(textField:flash.text.TextField,
                                                  text:String, isHtmlText:Boolean):void
        {
            var textFormat:flash.text.TextFormat = textField.defaultTextFormat;
            var maxTextWidth:int  = textField.width  - 4;
            var maxTextHeight:int = textField.height - 4;
            var size:Number = Number(textFormat.size);

            while (textField.textWidth > maxTextWidth || textField.textHeight > maxTextHeight)
            {
                if (size <= 4) break;

                textFormat.size = size--;
                textField.defaultTextFormat = textFormat;

                if (isHtmlText) textField.htmlText = text;
                else            textField.text     = text;
            }
        }
    }
}