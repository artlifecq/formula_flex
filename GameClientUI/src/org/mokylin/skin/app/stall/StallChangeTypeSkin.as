package org.mokylin.skin.app.stall
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Button;
	import feathers.controls.Label;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.component.button.ButtonV3_g_guanbi;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class StallChangeTypeSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var bg:feathers.controls.UIAsset;

		public var btnClose:feathers.controls.Button;

		public var stallTypeDis:feathers.controls.Label;

		public var stallTypeFace1:feathers.controls.UIAsset;

		public var stallTypeFace2:feathers.controls.UIAsset;

		public var stallTypeFace3:feathers.controls.UIAsset;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function StallChangeTypeSkin()
		{
			super();
			
			this.currentState = "normal";
			this.elementsContent = [bg_i(),btnClose_i(),__StallChangeTypeSkin_UIAsset1_i(),__StallChangeTypeSkin_UIAsset2_i(),__StallChangeTypeSkin_UIAsset3_i(),stallTypeFace1_i(),stallTypeFace2_i(),stallTypeFace3_i(),stallTypeDis_i(),__StallChangeTypeSkin_UIAsset4_i(),__StallChangeTypeSkin_UIAsset5_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __StallChangeTypeSkin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.touchable = false;
			temp.touchGroup = false;
			temp.touchGroup = false;
			temp.touchable = false;
			temp.styleName = "ui/common/version_3/T_tongyongbanzi/gao_guang.png";
			temp.width = 658;
			temp.x = 48;
			temp.y = 4;
			return temp;
		}

		private function __StallChangeTypeSkin_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.touchable = false;
			temp.touchGroup = false;
			temp.styleName = "ui/app/stall/title.png";
			temp.x = 356;
			temp.y = 8;
			return temp;
		}

		private function __StallChangeTypeSkin_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/stall/di.png";
			temp.x = 12;
			temp.y = 35;
			return temp;
		}

		private function __StallChangeTypeSkin_UIAsset4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/stall/tanweishuoming.png";
			temp.x = 396;
			temp.y = 47;
			return temp;
		}

		private function __StallChangeTypeSkin_UIAsset5_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/stall/tanweixinxiang.png";
			temp.x = 7;
			temp.y = 47;
			return temp;
		}

		private function bg_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			bg = temp;
			temp.name = "bg";
			temp.height = 460;
			temp.styleName = "ui/common/version_3/T_tongyongbanzi/di_ban.png";
			temp.width = 758;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function btnClose_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnClose = temp;
			temp.name = "btnClose";
			temp.height = 25;
			temp.styleClass = org.mokylin.skin.component.button.ButtonV3_g_guanbi;
			temp.width = 25;
			temp.x = 722;
			temp.y = 6;
			return temp;
		}

		private function stallTypeDis_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			stallTypeDis = temp;
			temp.name = "stallTypeDis";
			temp.height = 241;
			temp.text = "1.XXXXXXXXXXXXXXXXX";
			temp.color = 0xE9C099;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 302;
			temp.x = 440;
			temp.y = 93;
			return temp;
		}

		private function stallTypeFace1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			stallTypeFace1 = temp;
			temp.name = "stallTypeFace1";
			temp.styleName = "ui/app/stall/tanwei_1.png";
			temp.x = 79;
			temp.y = 76;
			return temp;
		}

		private function stallTypeFace2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			stallTypeFace2 = temp;
			temp.name = "stallTypeFace2";
			temp.styleName = "ui/app/stall/tanwei_2.png";
			temp.x = 96;
			temp.y = 72;
			return temp;
		}

		private function stallTypeFace3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			stallTypeFace3 = temp;
			temp.name = "stallTypeFace3";
			temp.styleName = "ui/app/stall/tanwei_3.png";
			temp.x = 102;
			temp.y = 78;
			return temp;
		}

	}
}