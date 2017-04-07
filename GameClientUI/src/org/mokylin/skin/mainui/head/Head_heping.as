package org.mokylin.skin.mainui.head
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Button;
	import feathers.controls.Label;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.mainui.head.button.ButtonSelect;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class Head_heping extends feathers.controls.StateSkin
	{

		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function Head_heping()
		{
			super();
			
			this.currentState = "normal";
			this.elementsContent = [__Head_heping_Button1_i(),__Head_heping_Label1_i(),__Head_heping_UIAsset1_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __Head_heping_Button1_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			temp.styleClass = org.mokylin.skin.mainui.head.button.ButtonSelect;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function __Head_heping_Label1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.touchable = false;
			temp.touchGroup = false;
			temp.letterSpacing = 0;
			temp.text = "【和平模式】您的攻击不会对任何玩家招财伤害";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 27;
			temp.y = 3;
			return temp;
		}

		private function __Head_heping_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.touchable = false;
			temp.touchGroup = false;
			temp.styleName = "ui/mainui/head/button/skin_heping/up.png";
			temp.x = 4;
			temp.y = 2;
			return temp;
		}

	}
}