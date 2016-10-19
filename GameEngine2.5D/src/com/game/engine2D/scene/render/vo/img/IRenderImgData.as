package com.game.engine2D.scene.render.vo.img
{
	import com.game.engine2D.core.ATFSubTexture;

	public interface IRenderImgData
	{
		function getSubTexture($key:String):ATFSubTexture
		function dispose():void;
	}
}