package org.mokylin.skin.app.meiren
{
	import feathers.controls.Button;
	import feathers.controls.Group;
	import feathers.controls.SkinnableContainer;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import feathers.controls.UINumber;
	import org.mokylin.skin.app.meiren.button.ButtonQueren;
	import org.mokylin.skin.component.uinumber.UINumberJuese_zhanli;
	import org.mokylin.skin.component.uinumber.UINumberSkin_zhandouli_lv;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class Meiren_JinjieOk_Skin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var bg:feathers.controls.UIAsset;

		public var btnOk:feathers.controls.Button;

		public var ico_up:feathers.controls.UIAsset;

		public var mc_jieshu:feathers.controls.UIAsset;

		public var num_lv:feathers.controls.UINumber;

		public var roleGrp:feathers.controls.Group;

		public var uiGuangquan:feathers.controls.UIAsset;

		public var uiJName:feathers.controls.UIAsset;

		public var uiName:feathers.controls.UIAsset;

		public var ui_zhandouli:feathers.controls.UIAsset;

		public var userData:feathers.controls.UINumber;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function Meiren_JinjieOk_Skin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 558;
			this.width = 1048;
			this.elementsContent = [bg_i(),uiGuangquan_i(),__Meiren_JinjieOk_Skin_UIAsset1_i(),mc_jieshu_i(),uiJName_i(),btnOk_i(),ui_zhandouli_i(),userData_i(),num_lv_i(),ico_up_i(),uiName_i(),roleGrp_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __Meiren_JinjieOk_Skin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/big_bg/zuoqi/bg2.png";
			temp.x = 151;
			temp.y = 127;
			return temp;
		}

		private function bg_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			bg = temp;
			temp.name = "bg";
			temp.styleName = "ui/big_bg/meiren/bg3.png";
			temp.x = 386;
			temp.y = 206;
			return temp;
		}

		private function btnOk_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnOk = temp;
			temp.name = "btnOk";
			temp.styleClass = org.mokylin.skin.app.meiren.button.ButtonQueren;
			temp.x = 662;
			temp.y = 470;
			return temp;
		}

		private function ico_up_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			ico_up = temp;
			temp.name = "ico_up";
			temp.styleName = "ui/common/tubiao/jobup.png";
			temp.x = 846;
			temp.y = 256;
			return temp;
		}

		private function mc_jieshu_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			mc_jieshu = temp;
			temp.name = "mc_jieshu";
			temp.styleName = "ui/pet/jieshu/12.png";
			temp.x = 95;
			temp.y = 402;
			return temp;
		}

		private function num_lv_i():feathers.controls.UINumber
		{
			var temp:feathers.controls.UINumber = new feathers.controls.UINumber();
			num_lv = temp;
			temp.name = "num_lv";
			temp.gap = -4;
			temp.height = 25;
			temp.label = "3000";
			temp.styleClass = org.mokylin.skin.component.uinumber.UINumberSkin_zhandouli_lv;
			temp.width = 102;
			temp.x = 862;
			temp.y = 254;
			return temp;
		}

		private function roleGrp_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			roleGrp = temp;
			temp.name = "roleGrp";
			temp.height = 235;
			temp.width = 190;
			temp.x = 232;
			temp.y = 177;
			return temp;
		}

		private function uiGuangquan_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiGuangquan = temp;
			temp.name = "uiGuangquan";
			temp.styleName = "ui/big_bg/zuoqi/bg1.png";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function uiJName_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiJName = temp;
			temp.name = "uiJName";
			temp.styleName = "ui/app/meiren/head_icon/name2.png";
			temp.x = 130;
			temp.y = 413;
			return temp;
		}

		private function uiName_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiName = temp;
			temp.name = "uiName";
			temp.styleName = "ui/app/meiren/jjcg.png";
			temp.x = 603;
			temp.y = 108;
			return temp;
		}

		private function ui_zhandouli_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			ui_zhandouli = temp;
			temp.name = "ui_zhandouli";
			temp.styleName = "ui/art_txt/common/zhandouli1.png";
			temp.x = 614;
			temp.y = 244;
			return temp;
		}

		private function userData_i():feathers.controls.UINumber
		{
			var temp:feathers.controls.UINumber = new feathers.controls.UINumber();
			userData = temp;
			temp.name = "userData";
			temp.gap = -15;
			temp.height = 40;
			temp.label = "62984567";
			temp.styleClass = org.mokylin.skin.component.uinumber.UINumberJuese_zhanli;
			temp.width = 162;
			temp.x = 694;
			temp.y = 246;
			return temp;
		}

	}
}