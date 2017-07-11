package org.mokylin.skin.common
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Button;
	import feathers.controls.Label;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.component.button.ButtonSkin_jia;
	import org.mokylin.skin.component.button.ButtonSkin_jian;
	
	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class Flip_Skin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var bg0:feathers.controls.UIAsset;
		
		public var btnAdd:feathers.controls.Button;
		
		public var btnDec:feathers.controls.Button;
		
		public var lbBuyNum:feathers.controls.Label;
		
		
		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function Flip_Skin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 25;
			this.width = 102;
			this.elementsContent = [bg0_i(),lbBuyNum_i(),btnDec_i(),btnAdd_i()];
			
			states = {
			};
			skinNames={};
		}
		
		
		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function bg0_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			bg0 = temp;
			temp.name = "bg0";
			temp.styleName = "ui/component/text/input_bg.png";
			temp.width = 60;
			temp.x = 21;
			temp.y = 0;
			return temp;
		}
		
		private function btnAdd_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnAdd = temp;
			temp.name = "btnAdd";
			temp.right = 0;
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_jia;
			temp.y = 2;
			return temp;
		}
		
		private function btnDec_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnDec = temp;
			temp.name = "btnDec";
			temp.left = 0;
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_jian;
			temp.y = 2;
			return temp;
		}
		
		private function lbBuyNum_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbBuyNum = temp;
			temp.name = "lbBuyNum";
			temp.height = 21;
			temp.text = "1000";
			temp.textAlign = "center";
			temp.color = 0xBEA757;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 60;
			temp.x = 21;
			temp.y = 4;
			return temp;
		}
		
	}
}