package org.mokylin.skin.app.hunyin
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Button;
	import feathers.controls.Label;
	import feathers.controls.SkinnableContainer;
	import feathers.controls.StateSkin;
	import feathers.controls.TextInput;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.app.hunyin.button.ButtonQiuhun;
	import org.mokylin.skin.component.button.ButtonSkin_close;
	import org.mokylin.skin.component.text.textInput2_Skin;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class QiuHun_Skin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var btnClose:feathers.controls.Button;

		public var btnQiuHun:feathers.controls.Button;

		public var icon1:feathers.controls.UIAsset;

		public var icon2:feathers.controls.UIAsset;

		public var icon3:feathers.controls.UIAsset;

		public var icon4:feathers.controls.UIAsset;

		public var lbXiaoHao:feathers.controls.Label;

		public var lbZhenHun:feathers.controls.Label;

		public var skinContent:feathers.controls.SkinnableContainer;

		public var textInput:feathers.controls.TextInput;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function QiuHun_Skin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 728;
			this.width = 796;
			this.elementsContent = [__QiuHun_Skin_UIAsset1_i(),icon1_i(),icon2_i(),icon3_i(),icon4_i(),lbXiaoHao_i(),lbZhenHun_i(),btnQiuHun_i(),btnClose_i(),__QiuHun_Skin_SkinnableContainer1_i(),textInput_i(),skinContent_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __QiuHun_Skin_SkinnableContainer1_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			temp.height = 200;
			temp.width = 200;
			temp.x = 592;
			temp.y = 558;
			return temp;
		}

		private function __QiuHun_Skin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/hunyin/bg.png";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function btnClose_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnClose = temp;
			temp.name = "btnClose";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_close;
			temp.x = 708;
			temp.y = 110;
			return temp;
		}

		private function btnQiuHun_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnQiuHun = temp;
			temp.name = "btnQiuHun";
			temp.styleClass = org.mokylin.skin.app.hunyin.button.ButtonQiuhun;
			temp.x = 308;
			temp.y = 498;
			return temp;
		}

		private function icon1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			icon1 = temp;
			temp.name = "icon1";
			temp.styleName = "ui/common/grid/normal/64.png";
			temp.x = 227;
			temp.y = 344;
			return temp;
		}

		private function icon2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			icon2 = temp;
			temp.name = "icon2";
			temp.styleName = "ui/common/grid/normal/64.png";
			temp.x = 316;
			temp.y = 344;
			return temp;
		}

		private function icon3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			icon3 = temp;
			temp.name = "icon3";
			temp.styleName = "ui/common/grid/normal/64.png";
			temp.x = 405;
			temp.y = 344;
			return temp;
		}

		private function icon4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			icon4 = temp;
			temp.name = "icon4";
			temp.styleName = "ui/common/grid/normal/64.png";
			temp.x = 494;
			temp.y = 344;
			return temp;
		}

		private function lbXiaoHao_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbXiaoHao = temp;
			temp.name = "lbXiaoHao";
			temp.htmlText = "求婚需消耗<font color='#00ff33'>100</font>元宝，另一方免费";
			temp.color = 0xEAEABC;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 294;
			temp.y = 454;
			return temp;
		}

		private function lbZhenHun_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbZhenHun = temp;
			temp.name = "lbZhenHun";
			temp.text = "我要征婚（免费）";
			temp.color = 0x00FF33;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.underline = true;
			temp.x = 342;
			temp.y = 474;
			return temp;
		}

		private function skinContent_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			skinContent = temp;
			temp.name = "skinContent";
			temp.height = 144;
			temp.width = 131;
			temp.x = 331;
			temp.y = 181;
			return temp;
		}

		private function textInput_i():feathers.controls.TextInput
		{
			var temp:feathers.controls.TextInput = new feathers.controls.TextInput();
			textInput = temp;
			temp.name = "textInput";
			temp.height = 24;
			temp.left = 304;
			temp.right = 309;
			temp.styleClass = org.mokylin.skin.component.text.textInput2_Skin;
			temp.color = 0xA3A594;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.y = 426;
			return temp;
		}

	}
}