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
		public var btnSelect:feathers.controls.Button;

		public var grpIcon:feathers.controls.Group;

		public var imgBg_out:feathers.controls.UIAsset;

		public var imgBg_select:feathers.controls.UIAsset;

		public var lbNum:feathers.controls.Label;

		public var pass_group:feathers.controls.Group;

		public var pass_ico:feathers.controls.UIAsset;

		public var prob_ioc_0:feathers.controls.UIAsset;

		public var uiKunNan:feathers.controls.UIAsset;

		public var uiName1:feathers.controls.UIAsset;

		public var uiName2:feathers.controls.UIAsset;

		public var uibg:feathers.controls.UIAsset;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function FuBen_DuoRen_Item()
		{
			super();
			
			this.currentState = "normal";
			this.width = 539;
			this.elementsContent = [imgBg_select_i(),imgBg_out_i(),uibg_i(),uiName1_i(),uiName2_i(),lbNum_i(),btnSelect_i(),grpIcon_i(),pass_group_i(),uiKunNan_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __FuBen_DuoRen_Item_Label1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "机率掉落：";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 19;
			temp.y = 18;
			return temp;
		}

		private function __FuBen_DuoRen_Item_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 52;
			temp.styleName = "ui/app/fuben/daojubeijing.png";
			temp.width = 533;
			temp.x = 0;
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
			temp.y = 70;
			temp.elementsContent = [__FuBen_DuoRen_Item_UIAsset1_i(),__FuBen_DuoRen_Item_Label1_i(),prob_ioc_0_i()];
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

		private function lbNum_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbNum = temp;
			temp.name = "lbNum";
			temp.height = 18;
			temp.fontSize = 14;
			temp.text = "2/10通关奖励：";
			temp.textAlign = "right";
			temp.color = 0xEAEABC;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 121;
			temp.x = 350;
			temp.y = 29;
			return temp;
		}

		private function pass_group_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			pass_group = temp;
			temp.name = "pass_group";
			temp.x = 467;
			temp.y = 10;
			temp.elementsContent = [pass_ico_i()];
			return temp;
		}

		private function pass_ico_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			pass_ico = temp;
			temp.name = "pass_ico";
			temp.styleName = "ui/common/grid/normal/48.png";
			return temp;
		}

		private function prob_ioc_0_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			prob_ioc_0 = temp;
			temp.name = "prob_ioc_0";
			temp.styleName = "ui/common/grid/normal/36.png";
			temp.x = 108;
			temp.y = 6;
			return temp;
		}

		private function uiKunNan_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiKunNan = temp;
			temp.name = "uiKunNan";
			temp.styleName = "ui/common/kunnan.png";
			temp.x = 188;
			temp.y = 24;
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

		private function uibg_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uibg = temp;
			temp.name = "uibg";
			temp.styleName = "ui/app/fuben/mingzidi.png";
			temp.x = 13;
			temp.y = 17;
			return temp;
		}

	}
}