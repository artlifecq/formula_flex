package org.mokylin.skin.app.xingongneng
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Label;
	import feathers.controls.ProgressBar;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import feathers.controls.UINumber;
	import org.mokylin.skin.app.xingongneng.Pro_Level;
	import org.mokylin.skin.app.xingongneng.number.UINumberShuzi;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class YuGao_Skin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var Icons:feathers.controls.UIAsset;

		public var lbLevel:feathers.controls.Label;

		public var numLevel:feathers.controls.UINumber;

		public var proLevel:feathers.controls.ProgressBar;

		public var uiName:feathers.controls.UIAsset;

		public var uiTouxian:feathers.controls.UIAsset;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function YuGao_Skin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 150;
			this.width = 153;
			this.elementsContent = [__YuGao_Skin_UIAsset1_i(),__YuGao_Skin_UIAsset2_i(),uiTouxian_i(),uiName_i(),numLevel_i(),__YuGao_Skin_UIAsset3_i(),proLevel_i(),lbLevel_i(),Icons_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function Icons_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			Icons = temp;
			temp.name = "Icons";
			temp.styleName = "ui/app/xingongneng/icon/zuomo/95.png";
			temp.x = 29;
			temp.y = 1;
			return temp;
		}

		private function __YuGao_Skin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/xingongneng/bg3.png";
			temp.x = 23;
			temp.y = 0;
			return temp;
		}

		private function __YuGao_Skin_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/xingongneng/bg4.png";
			temp.x = 0;
			temp.y = 85;
			return temp;
		}

		private function __YuGao_Skin_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/xingongneng/jindutiao.png";
			temp.x = 8;
			temp.y = 127;
			return temp;
		}

		private function lbLevel_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbLevel = temp;
			temp.name = "lbLevel";
			temp.text = "50/60";
			temp.textAlign = "center";
			temp.color = 0xCDC9B0;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 67;
			temp.x = 44;
			temp.y = 129;
			return temp;
		}

		private function numLevel_i():feathers.controls.UINumber
		{
			var temp:feathers.controls.UINumber = new feathers.controls.UINumber();
			numLevel = temp;
			temp.name = "numLevel";
			temp.gap = 0;
			temp.height = 15;
			temp.label = "60";
			temp.styleClass = org.mokylin.skin.app.xingongneng.number.UINumberShuzi;
			temp.width = 24;
			temp.x = 97;
			temp.y = 111;
			return temp;
		}

		private function proLevel_i():feathers.controls.ProgressBar
		{
			var temp:feathers.controls.ProgressBar = new feathers.controls.ProgressBar();
			proLevel = temp;
			temp.name = "proLevel";
			temp.height = 11;
			temp.maximum = 60;
			temp.styleClass = org.mokylin.skin.app.xingongneng.Pro_Level;
			temp.value = 50;
			temp.width = 108;
			temp.x = 23;
			temp.y = 133;
			return temp;
		}

		private function uiName_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiName = temp;
			temp.name = "uiName";
			temp.styleName = "ui/app/xingongneng/icon/jingyanfuben/name1.png";
			temp.x = 3;
			temp.y = 75;
			return temp;
		}

		private function uiTouxian_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiTouxian = temp;
			temp.name = "uiTouxian";
			temp.styleName = "ui/app/xingongneng/icon/duorenfuben/word.png";
			temp.x = 44;
			temp.y = 91;
			return temp;
		}

	}
}