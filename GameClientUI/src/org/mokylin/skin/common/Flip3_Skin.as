package org.mokylin.skin.common
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Button;
	import feathers.controls.Label;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.component.button.ButtonSkin_you;
	import org.mokylin.skin.component.button.ButtonSkin_youmax;
	import org.mokylin.skin.component.button.ButtonSkin_zuo;
	import org.mokylin.skin.component.button.ButtonSkin_zuomax;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class Flip3_Skin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var bg:feathers.controls.UIAsset;

		public var btnAdd:feathers.controls.Button;

		public var btnDec:feathers.controls.Button;

		public var btnMax:feathers.controls.Button;

		public var btnMin:feathers.controls.Button;

		public var textDisplay:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function Flip3_Skin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 25;
			this.width = 160;
			this.elementsContent = [textDisplay_i(),btnDec_i(),btnMin_i(),btnAdd_i(),btnMax_i()];
			bg_i();
			
			
			states = {
			};
			skinNames={"disabled":"ui/component/text/input_bg.png", "enabled":"ui/component/text/input_bg.png", "focused":"ui/component/text/input_bg.png"};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function bg_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			bg = temp;
			temp.name = "bg";
			temp.left = 42;
			temp.right = 42;
			temp.styleName = "ui/component/text/input_bg.png";
			temp.y = 0;
			return temp;
		}

		private function btnAdd_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnAdd = temp;
			temp.name = "btnAdd";
			temp.right = 21;
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_you;
			temp.y = 2;
			return temp;
		}

		private function btnDec_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnDec = temp;
			temp.name = "btnDec";
			temp.left = 21;
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_zuo;
			temp.y = 2;
			return temp;
		}

		private function btnMax_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnMax = temp;
			temp.name = "btnMax";
			temp.right = 0;
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_youmax;
			temp.y = 2;
			return temp;
		}

		private function btnMin_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnMin = temp;
			temp.name = "btnMin";
			temp.left = 0;
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_zuomax;
			temp.y = 2;
			return temp;
		}

		private function textDisplay_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			textDisplay = temp;
			temp.name = "textDisplay";
			temp.left = 47;
			temp.right = 47;
			temp.text = "1/1";
			temp.textAlign = "center";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.y = 4;
			return temp;
		}

	}
}