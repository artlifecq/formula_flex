// =================================================================================================
//
//	Starling Framework
//	Copyright Gamua GmbH. All Rights Reserved.
//
//	This program is free software. You can redistribute and/or modify it
//	in accordance with the terms of the accompanying license agreement.
//
// =================================================================================================

package starling.utils
{
    import flash.display.Stage3D;
    import flash.display3D.Context3D;
    import flash.display3D.Context3DMipFilter;
    import flash.display3D.Context3DRenderMode;
    import flash.display3D.Context3DTextureFilter;
    import flash.display3D.Context3DTextureFormat;
    import flash.display3D.Context3DWrapMode;
    import flash.events.ErrorEvent;
    import flash.events.Event;
    import flash.utils.setTimeout;
    
    import starling.core.Starling;
    import starling.errors.AbstractClassError;
    import starling.textures.IStarlingTexture;

    /** A utility class containing methods related to Stage3D and rendering in general. */
    public class RenderUtil
    {
        /** @private */
        public function RenderUtil()
        {
            throw new AbstractClassError();
        }

        /** Clears the render context with a certain color and alpha value. */
        public static function clear(rgb:uint=0, alpha:Number=0.0):void
        {
            Starling.context.clear(
                    Color.getRed(rgb)   / 255.0,
                    Color.getGreen(rgb) / 255.0,
                    Color.getBlue(rgb)  / 255.0,
                    alpha);
        }

        /** Returns a bit field uniquely describing texture format and premultiplied alpha,
         *  so that each required AGAL variant will get its unique ID. This method is most
         *  useful when overriding the <code>programVariantName</code> method of custom
         *  effects.
         *
         *  @return a bit field using the 3 least significant bits.
         */
        public static function getTextureVariantBits(texture:IStarlingTexture):uint
        {
            if (texture == null) return 0;

            var bitField:uint = 0;
            var formatBits:uint = 0;

            switch (texture.format)
            {
                case Context3DTextureFormat.COMPRESSED_ALPHA:
                    formatBits = 3; break;
                case Context3DTextureFormat.COMPRESSED:
                    formatBits = 2; break;
                default:
                    formatBits = 1;
            }

            bitField |= formatBits;

            return bitField;
        }

        /** Creates an AGAL source string with a <code>tex</code> operation, including an options
         *  list with the appropriate format flag.
         *
         *  <p>Note that values for <code>repeat/clamp</code>, <code>filter</code> and
         *  <code>mip-filter</code> are not included in the options list, since it's preferred
         *  to set those values at runtime via <code>setSamplerStateAt</code>.</p>
         *
         *  <p>Starling expects every color to have its alpha value premultiplied into
         *  the RGB channels. Thus, if this method encounters a non-PMA texture, it will
         *  (per default) convert the color in the result register to PMA mode, resulting
         *  in an additional <code>mul</code>-operation.</p>
         *
         *  @param resultReg  the register to write the result into.
         *  @param uvReg      the register containing the texture coordinates.
         *  @param sampler    the texture sampler to use.
         *  @param texture    the texture that's active in the given texture sampler.
         *  @param convertToPmaIfRequired  indicates if a non-PMA color should be converted to PMA.
         *  @param tempReg    if 'resultReg' is the output register and PMA conversion is done,
         *                    a temporary register is needed.
         *
         *  @return the AGAL source code, line break(s) included.
         */
        public static function createAGALTexOperation(
                resultReg:String, uvReg:String, sampler:int, texture:IStarlingTexture,
                convertToPmaIfRequired:Boolean=true, tempReg:String="ft0"):String
        {
            var format:String = texture.format;
            var formatFlag:String;

            switch (format)
            {
                case Context3DTextureFormat.COMPRESSED:
                    formatFlag = "dxt1"; break;
                case Context3DTextureFormat.COMPRESSED_ALPHA:
                    formatFlag = "dxt5"; break;
                default:
                    formatFlag = "rgba";
            }

            var needsConversion:Boolean = convertToPmaIfRequired;
            var texReg:String = needsConversion && resultReg == "oc" ? tempReg : resultReg;
            var operation:String = "tex " + texReg + ", " + uvReg + ", fs" + sampler +
                            " <2d, " + formatFlag + ">\n";

            if (needsConversion)
            {
                if (resultReg == "oc") // the output color register cannot use a write mask ...
                {
                    operation += "mul " + texReg + ".xyz, " + texReg + ".xyz, " + texReg + ".www\n";
                    operation += "mov " + resultReg + ", " + texReg;
                }
                else
                {
                    operation += "mul " + resultReg + ".xyz, " + texReg + ".xyz, " + texReg + ".www\n";
                }
            }

            return operation;
        }

    }
}
