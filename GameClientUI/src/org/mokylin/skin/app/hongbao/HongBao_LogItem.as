package org.mokylin.skin.app.hongbao
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Label;
	import feathers.controls.SkinnableContainer;
	import feathers.controls.StateSkin;
	import org.mokylin.skin.common.ItemBg;
	
	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class HongBao_LogItem extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var bg:feathers.controls.SkinnableContainer;
		
		public var lbName:feathers.controls.Label;
		
		
		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function HongBao_LogItem()
		{
			super();
			
			this.currentState = "normal";
			this.height = 33;
			this.width = 619;
			this.elementsContent = [bg_i(),lbName_i()];
			
			states = {
			};
			skinNames={};
		}
		
		
		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function bg_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			bg = temp;
			temp.name = "bg";
			temp.height = 33;
			var skin:StateSkin = new org.mokylin.skin.common.ItemBg()
			temp.skin = skin
			temp.width = 619;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}
		
		private function lbName_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbName = temp;
			temp.name = "lbName";
			temp.text = "[2017-6-17 13:38:39]";
			temp.textAlign = "left";
			temp.color = 0xFFEA00;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 600;
			temp.x = 15;
			temp.y = 9;
			return temp;
		}
		
	}
}