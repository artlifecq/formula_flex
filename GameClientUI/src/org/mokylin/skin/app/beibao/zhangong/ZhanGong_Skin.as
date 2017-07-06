package org.mokylin.skin.app.beibao.zhangong
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Button;
	import feathers.controls.Group;
	import feathers.controls.Label;
	import feathers.controls.List;
	import feathers.controls.SkinnableContainer;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import feathers.controls.UINumber;
	import org.mokylin.skin.component.button.ButtonSkin_jiantou;
	import org.mokylin.skin.component.list.ListSkin1;
	import org.mokylin.skin.component.uinumber.UINumberSkin_zhandouli_lv2;
	import org.mokylin.skin.component.uinumber.UINumberSkin_zhandouli_yellow2;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class ZhanGong_Skin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var ListMap:feathers.controls.List;

		public var NumZhanli:feathers.controls.UINumber;

		public var bossItemRongQi:feathers.controls.SkinnableContainer;

		public var btnNext:feathers.controls.Button;

		public var btnPrev:feathers.controls.Button;

		public var grp_zhandouli:feathers.controls.Group;

		public var lb_shuxing:feathers.controls.Label;

		public var num_lv0:feathers.controls.UINumber;

		public var ui_zhandou:feathers.controls.UIAsset;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function ZhanGong_Skin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 601;
			this.width = 956;
			this.elementsContent = [__ZhanGong_Skin_UIAsset2_i(),__ZhanGong_Skin_UIAsset3_i(),grp_zhandouli_i(),lb_shuxing_i(),ListMap_i(),__ZhanGong_Skin_UIAsset4_i(),bossItemRongQi_i(),btnNext_i(),btnPrev_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function ListMap_i():feathers.controls.List
		{
			var temp:feathers.controls.List = new feathers.controls.List();
			ListMap = temp;
			temp.name = "ListMap";
			temp.height = 386;
			temp.styleClass = org.mokylin.skin.component.list.ListSkin1;
			temp.width = 238;
			temp.x = 28;
			temp.y = 147;
			return temp;
		}

		private function NumZhanli_i():feathers.controls.UINumber
		{
			var temp:feathers.controls.UINumber = new feathers.controls.UINumber();
			NumZhanli = temp;
			temp.name = "NumZhanli";
			temp.gap = -13;
			temp.height = 33;
			temp.label = "1364364";
			temp.styleClass = org.mokylin.skin.component.uinumber.UINumberSkin_zhandouli_yellow2;
			temp.width = 148;
			temp.x = 56;
			temp.y = 6;
			return temp;
		}

		private function __ZhanGong_Skin_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 396;
			temp.styleName = "ui/common/background/neikuang_1.png";
			temp.width = 250;
			temp.x = 21;
			temp.y = 141;
			return temp;
		}

		private function __ZhanGong_Skin_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/beibao/zhangong/banner.jpg";
			temp.x = 24;
			temp.y = 90;
			return temp;
		}

		private function __ZhanGong_Skin_UIAsset4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 396;
			temp.styleName = "ui/common/background/neikuang_1.png";
			temp.width = 666;
			temp.x = 270;
			temp.y = 141;
			return temp;
		}

		private function bossItemRongQi_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			bossItemRongQi = temp;
			temp.name = "bossItemRongQi";
			temp.height = 396;
			temp.width = 666;
			temp.x = 270;
			temp.y = 141;
			return temp;
		}

		private function btnNext_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnNext = temp;
			temp.name = "btnNext";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_jiantou;
			temp.x = 899;
			temp.y = 301;
			return temp;
		}

		private function btnPrev_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnPrev = temp;
			temp.name = "btnPrev";
			temp.scaleX = -1;
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_jiantou;
			temp.x = 307;
			temp.y = 301;
			return temp;
		}

		private function grp_zhandouli_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			grp_zhandouli = temp;
			temp.name = "grp_zhandouli";
			temp.x = 50;
			temp.y = 95;
			temp.elementsContent = [ui_zhandou_i(),NumZhanli_i(),num_lv0_i()];
			return temp;
		}

		private function lb_shuxing_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lb_shuxing = temp;
			temp.name = "lb_shuxing";
			temp.leading = 0;
			temp.letterSpacing = 0;
			temp.fontSize = 12;
			temp.text = "属性总加成";
			temp.color = 0x5CB006;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.underline = true;
			temp.x = 842;
			temp.y = 109;
			return temp;
		}

		private function num_lv0_i():feathers.controls.UINumber
		{
			var temp:feathers.controls.UINumber = new feathers.controls.UINumber();
			num_lv0 = temp;
			temp.name = "num_lv0";
			temp.gap = -2;
			temp.height = 13;
			temp.label = "x100";
			temp.styleClass = org.mokylin.skin.component.uinumber.UINumberSkin_zhandouli_lv2;
			temp.width = 64;
			temp.x = 167;
			temp.y = 20;
			return temp;
		}

		private function ui_zhandou_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			ui_zhandou = temp;
			temp.name = "ui_zhandou";
			temp.styleName = "ui/common/zdl2.png";
			temp.x = -15;
			temp.y = -4;
			return temp;
		}

	}
}