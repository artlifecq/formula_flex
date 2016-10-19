package com.rpgGame.core.view.uiComponent.face.cd
{
	/**
	 * 道具或技能UI类接口
	 * @author Carver
	 * 
	 */	
	public interface ICoolingItemFace
	{
		/**道具或技能VO*/
		function getCoolingItemVo():ICoolingItemVo;
		/**
		 * CDFace
		 * @param $creat 为true则要保证返回必须不能为null,即启用get方法, 否则如果不存在则返回null
		 */		
		function getCDFace($creat:Boolean=false):CDFace;
	}
}