// =================================================================================================
//
//	Starling Framework
//	Copyright Gamua GmbH. All Rights Reserved.
//
//	This program is free software. You can redistribute and/or modify it
//	in accordance with the terms of the accompanying license agreement.
//
// =================================================================================================

package starling.display
{
    /** A Sprite is the most lightweight, non-abstract container class.
     *  Use it as a simple means of grouping objects together in one coordinate system.
     *
     *  @see DisplayObject
     *  @see DisplayObjectContainer
     */
    public class Sprite extends DisplayObjectContainer
    {
        /** Creates an empty sprite. */
        public function Sprite()
        {
            super();
        }
		
		private var _graphics:Shape;
		public function get graphics():Shape
		{
			if(_graphics == null)
			{
				_graphics = new Shape();
				this.addChildAt(_graphics, 0);
			}
			return _graphics;
		}
		
    }
}