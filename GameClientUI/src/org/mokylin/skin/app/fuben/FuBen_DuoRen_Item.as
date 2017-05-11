package org.mokylin.skin.app.fuben
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Button;
	import feathers.controls.Group;
	import feathers.controls.Label;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.app.fuben.button.ButtonKuang;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class FuBen_DuoRen_Item extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var Icon0:feathers.controls.UIAsset;

		public var btnSelect:feathers.controls.Button;

		public var grpIcon:feathers.controls.Group;

		public var imgBg_out:feathers.controls.UIAsset;

		public var imgBg_select:feathers.controls.UIAsset;

		public var lbLevel:feathers.controls.Label;

		public var lbNum:feathers.controls.Label;

		public var uiName1:feathers.controls.UIAsset;

		public var uiName2:feathers.controls.UIAsset;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function FuBen_DuoRen_Item()
		{
			super();
			
			this.currentState = "normal";
			this.width = 539;
			this.elementsContent = [imgBg_select_i(),imgBg_out_i(),grpIcon_i(),uiName1_i(),uiName2_i(),lbLevel_i(),lbNum_i(),Icon0_i(),btnSelect_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function Icon0_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			Icon0 = temp;
			temp.name = "Icon0";
			temp.styleName = "ui/common/gezikuang/tubiaodikuang/48.png";
			temp.x = 458;
			temp.y = 12;
			return temp;
		}

		private function __FuBen_DuoRen_Item_Label1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "几率掉落：";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 16;
			temp.y = 14;
			return temp;
		}

		private function __FuBen_DuoRen_Item_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 47;
			temp.styleName = "ui/app/fuben/daojubeijing.png";
			temp.width = 533;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function __FuBen_DuoRen_Item_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/gezikuang/tubiaodikuang/36.png";
			temp.x = 101;
			temp.y = 0;
			return temp;
		}

		private function __FuBen_DuoRen_Item_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/gezikuang/tubiaodikuang/36.png";
			temp.x = 158;
			temp.y = 0;
			return temp;
		}

		private function __FuBen_DuoRen_Item_UIAsset4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/gezikuang/tubiaodikuang/36.png";
			temp.x = 215;
			temp.y = 0;
			return temp;
		}

		private function __FuBen_DuoRen_Item_UIAsset5_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/gezikuang/tubiaodikuang/36.png";
			temp.x = 271;
			temp.y = 0;
			return temp;
		}

		private function __FuBen_DuoRen_Item_UIAsset6_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/gezikuang/tubiaodikuang/36.png";
			temp.x = 328;
			temp.y = 0;
			return temp;
		}

		private function btnSelect_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnSelect = temp;
			temp.name = "btnSelect";
			temp.height = 91;
			temp.styleClass = org.mokylin.skin.app.fuben.button.ButtonKuang;
			temp.width = 539;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function grpIcon_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			grpIcon = temp;
			temp.name = "grpIcon";
			temp.x = 3;
			temp.y = 75;
			temp.elementsContent = [__FuBen_DuoRen_Item_UIAsset1_i(),__FuBen_DuoRen_Item_Label1_i(),__FuBen_DuoRen_Item_UIAsset2_i(),__FuBen_DuoRen_Item_UIAsset3_i(),__FuBen_DuoRen_Item_UIAsset4_i(),__FuBen_DuoRen_Item_UIAsset5_i(),__FuBen_DuoRen_Item_UIAsset6_i()];
			return temp;
		}

		private function imgBg_out_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			imgBg_out = temp;
			temp.name = "imgBg_out";
			temp.height = 91;
			temp.width = 539;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function imgBg_select_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			imgBg_select = temp;
			temp.name = "imgBg_select";
			temp.height = 125;
			temp.width = 539;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function lbLevel_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbLevel = temp;
			temp.name = "lbLevel";
			temp.fontSize = 14;
			temp.text = "（50级）";
			temp.color = 0xE8C958;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 77;
			temp.x = 140;
			temp.y = 36;
			return temp;
		}

		private function lbNum_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbNum = temp;
			temp.name = "lbNum";
			temp.height = 18;
			temp.fontSize = 14;
			temp.text = "2/10通关奖励：";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 109;
			temp.x = 364;
			temp.y = 33;
			return temp;
		}

		private function uiName1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiName1 = temp;
			temp.name = "uiName1";
			temp.x = 16;
			temp.y = 28;
			return temp;
		}

		private function uiName2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiName2 = temp;
			temp.name = "uiName2";
			temp.x = 16;
			temp.y = 28;
			return temp;
		}

	}
}