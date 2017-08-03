package org.mokylin.skin.app.zhuangbei.hecheng
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Label;
	import feathers.controls.Radio;
	import feathers.controls.SkinnableContainer;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.common.ItemBg;
	import org.mokylin.skin.component.button.ButtonSelect2_Skin;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class Cont_Item extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var bg:feathers.controls.SkinnableContainer;

		public var lb_Dispaly:feathers.controls.Label;

		public var selectedBtn:feathers.controls.Radio;

		public var ui_tishi:feathers.controls.UIAsset;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function Cont_Item()
		{
			super();
			
			this.currentState = "normal";
			this.height = 32;
			this.width = 245;
			this.elementsContent = [bg_i(),lb_Dispaly_i(),selectedBtn_i(),ui_tishi_i()];
			
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
			temp.height = 32;
			var skin:StateSkin = new org.mokylin.skin.common.ItemBg()
			temp.skin = skin
			temp.width = 245;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function lb_Dispaly_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lb_Dispaly = temp;
			temp.name = "lb_Dispaly";
			temp.htmlText = "中级鉴定图纸<font color='#bea757'>(10)</font>";
			temp.touchable = false;
			temp.touchGroup = true;
			temp.letterSpacing = -1;
			temp.fontSize = 16;
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 210;
			temp.x = 20;
			temp.y = 6;
			return temp;
		}

		private function selectedBtn_i():feathers.controls.Radio
		{
			var temp:feathers.controls.Radio = new feathers.controls.Radio();
			selectedBtn = temp;
			temp.name = "selectedBtn";
			temp.groupName = "radioGroup2";
			temp.height = 32;
			temp.styleClass = org.mokylin.skin.component.button.ButtonSelect2_Skin;
			temp.width = 245;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function ui_tishi_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			ui_tishi = temp;
			temp.name = "ui_tishi";
			temp.styleName = "ui/common/tubiao/tishi.png";
			temp.x = 227;
			temp.y = 3;
			return temp;
		}

	}
}