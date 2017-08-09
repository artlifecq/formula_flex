package org.mokylin.skin.app.paihangbang
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Group;
	import feathers.controls.Label;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import feathers.controls.UINumber;
	import org.mokylin.skin.component.uinumber.UINumberJuese_zhanli;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class PaiHang_Right extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var Icbg0:feathers.controls.UIAsset;

		public var Icbg1:feathers.controls.UIAsset;

		public var Icbg10:feathers.controls.UIAsset;

		public var Icbg11:feathers.controls.UIAsset;

		public var Icbg2:feathers.controls.UIAsset;

		public var Icbg3:feathers.controls.UIAsset;

		public var Icbg4:feathers.controls.UIAsset;

		public var Icbg5:feathers.controls.UIAsset;

		public var Icbg6:feathers.controls.UIAsset;

		public var Icbg7:feathers.controls.UIAsset;

		public var Icbg8:feathers.controls.UIAsset;

		public var Icbg9:feathers.controls.UIAsset;

		public var Icolingpai:feathers.controls.UIAsset;

		public var Icoring:feathers.controls.UIAsset;

		public var NumZhanli:feathers.controls.UINumber;

		public var bg_img:feathers.controls.UIAsset;

		public var content:feathers.controls.Group;

		public var gprNo:feathers.controls.Group;

		public var grpHead:feathers.controls.Group;

		public var grpKillIcon:feathers.controls.Group;

		public var grpRight:feathers.controls.Group;

		public var grpZhanli:feathers.controls.Group;

		public var headName:feathers.controls.UIAsset;

		public var headbg:feathers.controls.UIAsset;

		public var icon1:feathers.controls.UIAsset;

		public var icon2:feathers.controls.UIAsset;

		public var icon3:feathers.controls.UIAsset;

		public var icon4:feathers.controls.UIAsset;

		public var icon5:feathers.controls.UIAsset;

		public var icon6:feathers.controls.UIAsset;

		public var lbName:feathers.controls.Label;

		public var ui_zhandou:feathers.controls.UIAsset;

		public var weapons:feathers.controls.Group;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function PaiHang_Right()
		{
			super();
			
			this.currentState = "normal";
			this.height = 522;
			this.width = 370;
			this.elementsContent = [grpRight_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function Icbg0_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			Icbg0 = temp;
			temp.name = "Icbg0";
			temp.styleName = "ui/common/grid/equip/07hutui.png";
			temp.x = 7;
			temp.y = 0;
			return temp;
		}

		private function Icbg10_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			Icbg10 = temp;
			temp.name = "Icbg10";
			temp.styleName = "ui/common/grid/equip/11hunjie.png";
			temp.x = 7;
			temp.y = 302;
			return temp;
		}

		private function Icbg11_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			Icbg11 = temp;
			temp.name = "Icbg11";
			temp.styleName = "ui/common/grid/equip/12lingpai.png";
			temp.x = 301;
			temp.y = 302;
			return temp;
		}

		private function Icbg1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			Icbg1 = temp;
			temp.name = "Icbg1";
			temp.styleName = "ui/common/grid/equip/07hutui.png";
			temp.x = 7;
			temp.y = 59;
			return temp;
		}

		private function Icbg2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			Icbg2 = temp;
			temp.name = "Icbg2";
			temp.styleName = "ui/common/grid/equip/07hutui.png";
			temp.x = 7;
			temp.y = 119;
			return temp;
		}

		private function Icbg3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			Icbg3 = temp;
			temp.name = "Icbg3";
			temp.styleName = "ui/common/grid/equip/07hutui.png";
			temp.x = 7;
			temp.y = 178;
			return temp;
		}

		private function Icbg4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			Icbg4 = temp;
			temp.name = "Icbg4";
			temp.styleName = "ui/common/grid/equip/07hutui.png";
			temp.x = 7;
			temp.y = 237;
			return temp;
		}

		private function Icbg5_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			Icbg5 = temp;
			temp.name = "Icbg5";
			temp.styleName = "ui/common/grid/equip/07hutui.png";
			temp.x = 301;
			temp.y = 0;
			return temp;
		}

		private function Icbg6_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			Icbg6 = temp;
			temp.name = "Icbg6";
			temp.styleName = "ui/common/grid/equip/07hutui.png";
			temp.x = 301;
			temp.y = 59;
			return temp;
		}

		private function Icbg7_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			Icbg7 = temp;
			temp.name = "Icbg7";
			temp.styleName = "ui/common/grid/equip/07hutui.png";
			temp.x = 301;
			temp.y = 119;
			return temp;
		}

		private function Icbg8_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			Icbg8 = temp;
			temp.name = "Icbg8";
			temp.styleName = "ui/common/grid/equip/07hutui.png";
			temp.x = 301;
			temp.y = 178;
			return temp;
		}

		private function Icbg9_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			Icbg9 = temp;
			temp.name = "Icbg9";
			temp.styleName = "ui/common/grid/equip/07hutui.png";
			temp.x = 301;
			temp.y = 237;
			return temp;
		}

		private function Icolingpai_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			Icolingpai = temp;
			temp.name = "Icolingpai";
			temp.styleName = "ui/app/paihangbang/huijiebiankuang.png";
			temp.x = 293;
			temp.y = 296;
			return temp;
		}

		private function Icoring_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			Icoring = temp;
			temp.name = "Icoring";
			temp.styleName = "ui/app/paihangbang/huijiebiankuang.png";
			temp.x = -1;
			temp.y = 296;
			return temp;
		}

		private function NumZhanli_i():feathers.controls.UINumber
		{
			var temp:feathers.controls.UINumber = new feathers.controls.UINumber();
			NumZhanli = temp;
			temp.name = "NumZhanli";
			temp.gap = -15;
			temp.height = 40;
			temp.label = "629845899";
			temp.styleClass = org.mokylin.skin.component.uinumber.UINumberJuese_zhanli;
			temp.width = 209;
			temp.x = 70;
			temp.y = 0;
			return temp;
		}

		private function __PaiHang_Right_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/paihangbang/bg2.png";
			temp.x = 0;
			temp.y = 471;
			return temp;
		}

		private function __PaiHang_Right_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/big_bg/paihangbang/bg.png";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function __PaiHang_Right_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/paihangbang/word/xuweiyidai.png";
			temp.x = 84;
			temp.y = 102;
			return temp;
		}

		private function bg_img_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			bg_img = temp;
			temp.name = "bg_img";
			temp.styleName = "ui/big_bg/paihangbang/bg0.png";
			temp.x = 5;
			temp.y = 20;
			return temp;
		}

		private function content_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			content = temp;
			temp.name = "content";
			temp.height = 400;
			temp.width = 260;
			temp.x = 54;
			temp.y = 51;
			return temp;
		}

		private function gprNo_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			gprNo = temp;
			temp.name = "gprNo";
			temp.x = 74;
			temp.y = 86;
			temp.elementsContent = [__PaiHang_Right_UIAsset2_i(),__PaiHang_Right_UIAsset3_i()];
			return temp;
		}

		private function grpHead_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			grpHead = temp;
			temp.name = "grpHead";
			temp.x = 76;
			temp.y = 0;
			temp.elementsContent = [headbg_i(),headName_i(),lbName_i()];
			return temp;
		}

		private function grpKillIcon_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			grpKillIcon = temp;
			temp.name = "grpKillIcon";
			temp.x = 9;
			temp.y = 410;
			temp.elementsContent = [icon1_i(),icon2_i(),icon3_i(),icon4_i(),icon5_i(),icon6_i()];
			return temp;
		}

		private function grpRight_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			grpRight = temp;
			temp.name = "grpRight";
			temp.x = 0;
			temp.y = 0;
			temp.elementsContent = [__PaiHang_Right_UIAsset1_i(),bg_img_i(),grpHead_i(),gprNo_i(),content_i(),grpZhanli_i(),grpKillIcon_i(),weapons_i()];
			return temp;
		}

		private function grpZhanli_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			grpZhanli = temp;
			temp.name = "grpZhanli";
			temp.x = 63;
			temp.y = 479;
			temp.elementsContent = [NumZhanli_i(),ui_zhandou_i()];
			return temp;
		}

		private function headName_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			headName = temp;
			temp.name = "headName";
			temp.styleName = "ui/app/paihangbang/word/zhanqi/1.png";
			temp.x = 75;
			temp.y = 5;
			return temp;
		}

		private function headbg_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			headbg = temp;
			temp.name = "headbg";
			temp.styleName = "ui/app/paihangbang/mingzikuang.png";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function icon1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			icon1 = temp;
			temp.name = "icon1";
			temp.styleName = "ui/app/paihangbang/weikaiqi.png";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function icon2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			icon2 = temp;
			temp.name = "icon2";
			temp.styleName = "ui/app/paihangbang/weikaiqi.png";
			temp.x = 59;
			temp.y = 0;
			return temp;
		}

		private function icon3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			icon3 = temp;
			temp.name = "icon3";
			temp.styleName = "ui/app/paihangbang/weikaiqi.png";
			temp.x = 118;
			temp.y = 0;
			return temp;
		}

		private function icon4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			icon4 = temp;
			temp.name = "icon4";
			temp.styleName = "ui/app/paihangbang/weikaiqi.png";
			temp.x = 177;
			temp.y = 0;
			return temp;
		}

		private function icon5_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			icon5 = temp;
			temp.name = "icon5";
			temp.styleName = "ui/app/paihangbang/weikaiqi.png";
			temp.x = 237;
			temp.y = 0;
			return temp;
		}

		private function icon6_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			icon6 = temp;
			temp.name = "icon6";
			temp.styleName = "ui/app/paihangbang/weikaiqi.png";
			temp.x = 297;
			temp.y = 0;
			return temp;
		}

		private function lbName_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbName = temp;
			temp.name = "lbName";
			temp.text = "姓名六个字的";
			temp.textAlign = "center";
			temp.color = 0xA3A594;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 151;
			temp.x = 35;
			temp.y = 8;
			return temp;
		}

		private function ui_zhandou_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			ui_zhandou = temp;
			temp.name = "ui_zhandou";
			temp.styleName = "ui/app/paihangbang/word/zongzhanli.png";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function weapons_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			weapons = temp;
			temp.name = "weapons";
			temp.height = 364;
			temp.width = 368;
			temp.x = 2;
			temp.y = 74;
			temp.elementsContent = [Icbg0_i(),Icbg5_i(),Icbg1_i(),Icbg6_i(),Icbg2_i(),Icbg7_i(),Icbg3_i(),Icbg8_i(),Icbg4_i(),Icbg9_i(),Icoring_i(),Icbg10_i(),Icolingpai_i(),Icbg11_i()];
			return temp;
		}

	}
}