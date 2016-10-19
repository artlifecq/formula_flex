package com.rpgGame.core.ui
{
	import com.rpgGame.coreData.info.stat.StatData;
	
	import feathers.controls.StateSkin;

	/**
	 *  单条的属性条
	 * 必须要重写setBaseStatStr
	 * 可选setOtherStatStr
	 * @author Mandragora
	 * 
	 */	
	public class SpriteStatLine extends SkinUI
	{
		public function SpriteStatLine(skin:StateSkin=null)
		{
			super(skin);
		}
		
		/**设置实现该方法的显示类的属性文字,内容大概为 攻击 100-200 
		 * 防御 60 / 攻击 30%+10% 
		 * str 为默认显示的文字
		 * stat是为了帮助显示自定义格式的文字的
		 * **/
		public function setBaseStatStr(str:String,stat:StatData):void
		{
			
		}
		/**
		 * 用于显示对比属性，
		 * @param isAdd 帮助控制箭头的
		 * @param addvalue 添加/减少的值，需要自己写显示的地方
		 * 
		 */		
		public function setOtherStatStr(isAdd:Boolean,addValue:Number):void
		{
			
		}
	}
}