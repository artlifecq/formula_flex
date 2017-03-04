package org.mokylin.skin.app.tips
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Button;
	import feathers.controls.Label;
	import feathers.controls.SkinnableContainer;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.app.tips.baseZhuangbeiItems;
	import org.mokylin.skin.component.button.ButtonSkin_close2;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class chuandaiTips_Skin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var Items:feathers.controls.SkinnableContainer;

		public var btnClose:feathers.controls.Button;

		public var lbl_tips:feathers.controls.Label;

		public var lbl_title:feathers.controls.Label;

		public var line:feathers.controls.UIAsset;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function chuandaiTips_Skin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 168;
			this.width = 208;
			this.elementsContent = [__chuandaiTips_Skin_UIAsset1_i(),line_i(),lbl_title_i(),lbl_tips_i(),Items_i(),btnClose_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function Items_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			Items = temp;
			temp.name = "Items";
			temp.height = 63;
			var skin:StateSkin = new org.mokylin.skin.app.tips.baseZhuangbeiItems()
			temp.skin = skin
			temp.width = 191;
			temp.x = 9;
			temp.y = 37;
			return temp;
		}

		private function __chuandaiTips_Skin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 168;
			temp.styleName = "ui/common/tips/tips_2.png";
			temp.width = 208;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function btnClose_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnClose = temp;
			temp.name = "btnClose";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_close2;
			temp.x = 188;
			temp.y = 10;
			return temp;
		}

		private function lbl_tips_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbl_tips = temp;
			temp.name = "lbl_tips";
			temp.text = "无";
			temp.textAlign = "center";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 99;
			temp.y = 121;
			return temp;
		}

		private function lbl_title_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbl_title = temp;
			temp.name = "lbl_title";
			temp.bold = true;
			temp.letterSpacing = 0;
			temp.fontSize = 16;
			temp.text = "可穿戴设备";
			temp.color = 0xB8AD80;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 61;
			temp.y = 6;
			return temp;
		}

		private function line_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			line = temp;
			temp.name = "line";
			temp.height = 3;
			temp.styleName = "ui/common/tips/tips_2fengexian.png";
			temp.width = 203;
			temp.x = 3;
			temp.y = 29;
			return temp;
		}

	}
}