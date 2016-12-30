package org.mokylin.skin.app.beibao
{
	import feathers.controls.text.Fontter;
	import feathers.data.ListCollection;
	import feathers.controls.Button;
	import feathers.controls.Group;
	import feathers.controls.Label;
	import feathers.controls.ProgressBar;
	import feathers.controls.StateSkin;
	import feathers.controls.TabBar;
	import feathers.controls.UIAsset;
	import feathers.controls.UINumber;
	import feathers.controls.ScrollContainer;
	import feathers.layout.HorizontalLayout;
	import org.mokylin.skin.app.beibao.button.ButtonShuxing;
	import org.mokylin.skin.app.beibao.button.ButtonTaozhuang;
	import org.mokylin.skin.component.button.ButtonSkin_btn1;
	import org.mokylin.skin.component.button.ButtonSkin_close;
	import org.mokylin.skin.component.progress.progress_role1_Skin;
	import org.mokylin.skin.component.progress.progress_role2_Skin;
	import org.mokylin.skin.component.scrollbar.ScrollBarSkin_pack;
	import org.mokylin.skin.component.tabbar.TabBarSkin_pack;
	import org.mokylin.skin.component.uinumber.UINumberSkin_zhandouli;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class beibao_Skin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var Icbg0:feathers.controls.UIAsset;

		public var Icbg1:feathers.controls.UIAsset;

		public var Icbg2:feathers.controls.UIAsset;

		public var Icbg3:feathers.controls.UIAsset;

		public var Icbg4:feathers.controls.UIAsset;

		public var Icbg5:feathers.controls.UIAsset;

		public var Icbg6:feathers.controls.UIAsset;

		public var Icbg7:feathers.controls.UIAsset;

		public var Icbg8:feathers.controls.UIAsset;

		public var Icbg9:feathers.controls.UIAsset;

		public var Icon0:feathers.controls.UIAsset;

		public var Icon1:feathers.controls.UIAsset;

		public var Icon2:feathers.controls.UIAsset;

		public var Icon3:feathers.controls.UIAsset;

		public var Icon4:feathers.controls.UIAsset;

		public var Icons:feathers.controls.Group;

		public var LoveIcon:feathers.controls.UIAsset;

		public var Num_zhandouli:feathers.controls.UINumber;

		public var btn0:feathers.controls.Button;

		public var btn1:feathers.controls.Button;

		public var btn_close:feathers.controls.Button;

		public var btn_getYuanbao:feathers.controls.Button;

		public var btn_nv:feathers.controls.Group;

		public var footMsg:feathers.controls.Group;

		public var headMsg:feathers.controls.Group;

		public var lbl_jy:feathers.controls.Label;

		public var lbl_t0:feathers.controls.Label;

		public var lbl_t1:feathers.controls.Label;

		public var lbl_t10:feathers.controls.Label;

		public var lbl_t11:feathers.controls.Label;

		public var lbl_t12:feathers.controls.Label;

		public var lbl_t13:feathers.controls.Label;

		public var lbl_t14:feathers.controls.Label;

		public var lbl_t15:feathers.controls.Label;

		public var lbl_t2:feathers.controls.Label;

		public var lbl_t3:feathers.controls.Label;

		public var lbl_t4:feathers.controls.Label;

		public var lbl_t5:feathers.controls.Label;

		public var lbl_t6:feathers.controls.Label;

		public var lbl_t7:feathers.controls.Label;

		public var lbl_t8:feathers.controls.Label;

		public var lbl_t9:feathers.controls.Label;

		public var lbl_zq:feathers.controls.Label;

		public var mIcon0:feathers.controls.UIAsset;

		public var mIcon1:feathers.controls.UIAsset;

		public var mIcon2:feathers.controls.UIAsset;

		public var mIcon3:feathers.controls.UIAsset;

		public var money:feathers.controls.Group;

		public var packs:feathers.controls.Group;

		public var pro_jinyan:feathers.controls.ProgressBar;

		public var pro_zhenqi:feathers.controls.ProgressBar;

		public var tab_pack:feathers.controls.TabBar;

		public var txt:feathers.controls.Group;

		public var txt0:feathers.controls.Label;

		public var txt1:feathers.controls.Label;

		public var txt2:feathers.controls.Label;

		public var txt3:feathers.controls.Label;

		public var txt_cur:feathers.controls.Label;

		public var txt_jinyan:feathers.controls.Label;

		public var txt_level:feathers.controls.Label;

		public var txt_loveName:feathers.controls.Label;

		public var txt_qu:feathers.controls.Label;

		public var txt_roleName:feathers.controls.Label;

		public var txt_t0:feathers.controls.Label;

		public var txt_t1:feathers.controls.Label;

		public var txt_t10:feathers.controls.Label;

		public var txt_t11:feathers.controls.Label;

		public var txt_t12:feathers.controls.Label;

		public var txt_t13:feathers.controls.Label;

		public var txt_t14:feathers.controls.Label;

		public var txt_t15:feathers.controls.Label;

		public var txt_t2:feathers.controls.Label;

		public var txt_t3:feathers.controls.Label;

		public var txt_t4:feathers.controls.Label;

		public var txt_t5:feathers.controls.Label;

		public var txt_t6:feathers.controls.Label;

		public var txt_t7:feathers.controls.Label;

		public var txt_t8:feathers.controls.Label;

		public var txt_t9:feathers.controls.Label;

		public var txt_team:feathers.controls.Label;

		public var txt_type:feathers.controls.Label;

		public var txt_zhenqi:feathers.controls.Label;

		public var values:feathers.controls.Group;

		public var vs_Bar:feathers.controls.ScrollContainer;

		public var weapons:feathers.controls.Group;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function beibao_Skin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 587;
			this.width = 947;
			this.elementsContent = [__beibao_Skin_UIAsset1_i(),__beibao_Skin_UIAsset2_i(),headMsg_i(),weapons_i(),footMsg_i(),values_i(),packs_i(),btn_nv_i(),__beibao_Skin_UIAsset18_i(),btn_close_i()];
			
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
			temp.styleName = "ui/app/beibao/01shoubi.png";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function Icbg1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			Icbg1 = temp;
			temp.name = "Icbg1";
			temp.styleName = "ui/app/beibao/03yaodai.png";
			temp.x = 0;
			temp.y = 59.5;
			return temp;
		}

		private function Icbg2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			Icbg2 = temp;
			temp.name = "Icbg2";
			temp.styleName = "ui/app/beibao/05xiongjia.png";
			temp.x = 0;
			temp.y = 118.5;
			return temp;
		}

		private function Icbg3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			Icbg3 = temp;
			temp.name = "Icbg3";
			temp.styleName = "ui/app/beibao/07hutui.png";
			temp.x = 0;
			temp.y = 177.5;
			return temp;
		}

		private function Icbg4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			Icbg4 = temp;
			temp.name = "Icbg4";
			temp.styleName = "ui/app/beibao/09maozi.png";
			temp.x = 0;
			temp.y = 236;
			return temp;
		}

		private function Icbg5_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			Icbg5 = temp;
			temp.name = "Icbg5";
			temp.styleName = "ui/app/beibao/02xiezi.png";
			temp.x = 284;
			temp.y = 0;
			return temp;
		}

		private function Icbg6_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			Icbg6 = temp;
			temp.name = "Icbg6";
			temp.styleName = "ui/app/beibao/04diaozui.png";
			temp.x = 284;
			temp.y = 59.5;
			return temp;
		}

		private function Icbg7_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			Icbg7 = temp;
			temp.name = "Icbg7";
			temp.styleName = "ui/app/beibao/06jiezhi.png";
			temp.x = 284;
			temp.y = 118.5;
			return temp;
		}

		private function Icbg8_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			Icbg8 = temp;
			temp.name = "Icbg8";
			temp.styleName = "ui/app/beibao/08yupei.png";
			temp.x = 284;
			temp.y = 177.5;
			return temp;
		}

		private function Icbg9_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			Icbg9 = temp;
			temp.name = "Icbg9";
			temp.styleName = "ui/app/beibao/10wuqi.png";
			temp.x = 284;
			temp.y = 236;
			return temp;
		}

		private function Icon0_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			Icon0 = temp;
			temp.name = "Icon0";
			temp.styleName = "ui/app/beibao/beibaoIcon/chushou.png";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function Icon1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			Icon1 = temp;
			temp.name = "Icon1";
			temp.styleName = "ui/app/beibao/beibaoIcon/zhengli.png";
			temp.x = 43;
			temp.y = 0;
			return temp;
		}

		private function Icon2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			Icon2 = temp;
			temp.name = "Icon2";
			temp.styleName = "ui/app/beibao/beibaoIcon/cangku.png";
			temp.x = 87;
			temp.y = 0;
			return temp;
		}

		private function Icon3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			Icon3 = temp;
			temp.name = "Icon3";
			temp.styleName = "ui/app/beibao/beibaoIcon/shangdian.png";
			temp.x = 130;
			temp.y = 0;
			return temp;
		}

		private function Icon4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			Icon4 = temp;
			temp.name = "Icon4";
			temp.styleName = "ui/app/beibao/beibaoIcon/paimaihang.png";
			temp.x = 174;
			temp.y = 0;
			return temp;
		}

		private function Icons_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			Icons = temp;
			temp.name = "Icons";
			temp.x = 12;
			temp.y = 406;
			temp.elementsContent = [Icon0_i(),Icon1_i(),Icon2_i(),Icon3_i(),Icon4_i(),btn_getYuanbao_i()];
			return temp;
		}

		private function LoveIcon_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			LoveIcon = temp;
			temp.name = "LoveIcon";
			temp.styleName = "ui/app/beibao/xin.png";
			temp.x = 1;
			temp.y = 42;
			return temp;
		}

		private function Num_zhandouli_i():feathers.controls.UINumber
		{
			var temp:feathers.controls.UINumber = new feathers.controls.UINumber();
			Num_zhandouli = temp;
			temp.name = "Num_zhandouli";
			temp.gap = -5;
			temp.height = 25;
			temp.label = "6521478";
			temp.styleClass = org.mokylin.skin.component.uinumber.UINumberSkin_zhandouli;
			temp.width = 123;
			temp.x = 126;
			temp.y = 0;
			return temp;
		}

		private function __beibao_Skin_ArrayCollection1_i():feathers.data.ListCollection
		{
			var temp:feathers.data.ListCollection = new feathers.data.ListCollection();
			temp.data = ['全部','装备','药品','材料','其他'];
			return temp;
		}

		private function __beibao_Skin_Group1_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			temp.x = 11;
			temp.y = 109;
			temp.elementsContent = [lbl_t0_i(),lbl_t1_i(),lbl_t2_i(),lbl_t3_i(),lbl_t4_i(),lbl_t5_i(),lbl_t6_i(),lbl_t7_i(),lbl_t8_i(),lbl_t9_i(),lbl_t10_i(),lbl_t11_i(),lbl_t12_i(),lbl_t13_i(),lbl_t14_i(),lbl_t15_i()];
			return temp;
		}

		private function __beibao_Skin_HorizontalLayout1_i():feathers.layout.HorizontalLayout
		{
			var temp:feathers.layout.HorizontalLayout = new feathers.layout.HorizontalLayout();
			temp.gap = 0;
			return temp;
		}

		private function __beibao_Skin_Label1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.fontSize = 12;
			temp.text = "关键属性";
			temp.color = 0x99915C;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 70;
			temp.y = 6;
			return temp;
		}

		private function __beibao_Skin_Label2_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.bold = true;
			temp.fontSize = 16;
			temp.text = "秒伤：";
			temp.color = 0xF2B13B;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 27;
			temp.y = 28;
			return temp;
		}

		private function __beibao_Skin_Label3_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.fontSize = 12;
			temp.text = "基础属性";
			temp.color = 0x99915C;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 70;
			temp.y = 53;
			return temp;
		}

		private function __beibao_Skin_UIAsset10_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 422;
			temp.styleName = "ui/app/beibao/cukuangdi.png";
			temp.width = 339;
			temp.x = 2;
			temp.y = 27;
			return temp;
		}

		private function __beibao_Skin_UIAsset11_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/beibao/huawendi.png";
			temp.x = 6;
			temp.y = 405;
			return temp;
		}

		private function __beibao_Skin_UIAsset12_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/beibao/fengexian.png";
			temp.width = 333;
			temp.x = 5;
			temp.y = 341;
			return temp;
		}

		private function __beibao_Skin_UIAsset13_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/beibao/fengexian.png";
			temp.width = 333;
			temp.x = 5;
			temp.y = 399;
			return temp;
		}

		private function __beibao_Skin_UIAsset14_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/beibao/neikuang.png";
			temp.width = 128;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function __beibao_Skin_UIAsset15_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 23;
			temp.styleName = "ui/app/beibao/neikuang.png";
			temp.width = 128;
			temp.x = 0;
			temp.y = 26;
			return temp;
		}

		private function __beibao_Skin_UIAsset16_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/beibao/neikuang.png";
			temp.width = 128;
			temp.x = 163;
			temp.y = 0;
			return temp;
		}

		private function __beibao_Skin_UIAsset17_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 23;
			temp.styleName = "ui/app/beibao/neikuang.png";
			temp.width = 128;
			temp.x = 163;
			temp.y = 26;
			return temp;
		}

		private function __beibao_Skin_UIAsset18_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/beibao/beibao.png";
			temp.x = 449;
			temp.y = 14;
			return temp;
		}

		private function __beibao_Skin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 587;
			temp.repeatScale9Skin = false;
			temp.styleName = "ui/common/background/tongyongdi.png";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function __beibao_Skin_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/beibao/bg.png";
			temp.x = 20;
			temp.y = 76;
			return temp;
		}

		private function __beibao_Skin_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 296;
			temp.styleName = "ui/app/beibao/zhuangbeidi.png";
			temp.width = 60;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function __beibao_Skin_UIAsset4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 296;
			temp.styleName = "ui/app/beibao/zhuangbeidi.png";
			temp.width = 60;
			temp.x = 284;
			temp.y = 0;
			return temp;
		}

		private function __beibao_Skin_UIAsset5_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/beibao/huawen_1.png";
			temp.x = 0;
			temp.y = 11;
			return temp;
		}

		private function __beibao_Skin_UIAsset6_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/beibao/huawen_2.png";
			temp.x = 261;
			temp.y = 11;
			return temp;
		}

		private function __beibao_Skin_UIAsset7_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/beibao/zhandouli.png";
			temp.x = 80;
			temp.y = 1;
			return temp;
		}

		private function __beibao_Skin_UIAsset8_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/beibao/shuxingkuang.png";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function __beibao_Skin_UIAsset9_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 449;
			temp.styleName = "ui/app/beibao/xikuangdi.png";
			temp.width = 343;
			temp.x = 0;
			temp.y = 1;
			return temp;
		}

		private function btn0_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn0 = temp;
			temp.name = "btn0";
			temp.styleClass = org.mokylin.skin.app.beibao.button.ButtonTaozhuang;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function btn1_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn1 = temp;
			temp.name = "btn1";
			temp.styleClass = org.mokylin.skin.app.beibao.button.ButtonShuxing;
			temp.x = 133;
			temp.y = 0;
			return temp;
		}

		private function btn_close_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_close = temp;
			temp.name = "btn_close";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_close;
			temp.x = 913;
			temp.y = 25;
			return temp;
		}

		private function btn_getYuanbao_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_getYuanbao = temp;
			temp.name = "btn_getYuanbao";
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack2"];
			temp.label = "获取元宝";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_btn1;
			temp.color = 0xE1D4A9;
			temp.x = 243;
			temp.y = 4;
			return temp;
		}

		private function btn_nv_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			btn_nv = temp;
			temp.name = "btn_nv";
			temp.x = 20;
			temp.y = 533;
			temp.elementsContent = [btn0_i(),btn1_i()];
			return temp;
		}

		private function footMsg_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			footMsg = temp;
			temp.name = "footMsg";
			temp.x = 237;
			temp.y = 485;
			temp.elementsContent = [__beibao_Skin_UIAsset5_i(),__beibao_Skin_UIAsset6_i(),__beibao_Skin_UIAsset7_i(),Num_zhandouli_i()];
			return temp;
		}

		private function headMsg_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			headMsg = temp;
			temp.name = "headMsg";
			temp.x = 233;
			temp.y = 76;
			temp.elementsContent = [txt_level_i(),txt_type_i(),LoveIcon_i(),txt_loveName_i(),txt_qu_i(),txt_roleName_i(),txt_team_i()];
			return temp;
		}

		private function lbl_jy_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbl_jy = temp;
			temp.name = "lbl_jy";
			temp.fontSize = 13;
			temp.text = "经验：";
			temp.color = 0xABAD97;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 11;
			temp.y = 69;
			return temp;
		}

		private function lbl_t0_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbl_t0 = temp;
			temp.name = "lbl_t0";
			temp.letterSpacing = -1;
			temp.text = "力道：";
			temp.color = 0xA79F4F;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function lbl_t10_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbl_t10 = temp;
			temp.name = "lbl_t10";
			temp.letterSpacing = -1;
			temp.text = "避闪率：";
			temp.color = 0xA79F4F;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 0;
			temp.y = 195;
			return temp;
		}

		private function lbl_t11_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbl_t11 = temp;
			temp.name = "lbl_t11";
			temp.letterSpacing = -1;
			temp.text = "防御百分比：";
			temp.color = 0xA79F4F;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 0;
			temp.y = 214;
			return temp;
		}

		private function lbl_t12_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbl_t12 = temp;
			temp.name = "lbl_t12";
			temp.letterSpacing = -1;
			temp.text = "生命恢复速度：";
			temp.color = 0xA79F4F;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 0;
			temp.y = 234;
			return temp;
		}

		private function lbl_t13_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbl_t13 = temp;
			temp.name = "lbl_t13";
			temp.letterSpacing = -1;
			temp.text = "治疗效果提升：";
			temp.color = 0xA79F4F;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 0;
			temp.y = 253;
			return temp;
		}

		private function lbl_t14_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbl_t14 = temp;
			temp.name = "lbl_t14";
			temp.letterSpacing = -1;
			temp.text = "暴击率：";
			temp.color = 0xA79F4F;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 0;
			temp.y = 273;
			return temp;
		}

		private function lbl_t15_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbl_t15 = temp;
			temp.name = "lbl_t15";
			temp.letterSpacing = -1;
			temp.text = "暴击加成：";
			temp.color = 0xA79F4F;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 0;
			temp.y = 292;
			return temp;
		}

		private function lbl_t1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbl_t1 = temp;
			temp.name = "lbl_t1";
			temp.letterSpacing = -1;
			temp.text = "根骨：";
			temp.color = 0x99915C;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 0;
			temp.y = 19;
			return temp;
		}

		private function lbl_t2_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbl_t2 = temp;
			temp.name = "lbl_t2";
			temp.letterSpacing = -1;
			temp.text = "慧根：";
			temp.color = 0x99915C;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 0;
			temp.y = 39;
			return temp;
		}

		private function lbl_t3_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbl_t3 = temp;
			temp.name = "lbl_t3";
			temp.letterSpacing = -1;
			temp.text = "身法：";
			temp.color = 0x99915C;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 0;
			temp.y = 58;
			return temp;
		}

		private function lbl_t4_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbl_t4 = temp;
			temp.name = "lbl_t4";
			temp.letterSpacing = -1;
			temp.text = "气血：";
			temp.color = 0x99915C;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 0;
			temp.y = 78;
			return temp;
		}

		private function lbl_t5_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbl_t5 = temp;
			temp.name = "lbl_t5";
			temp.letterSpacing = -1;
			temp.text = "外功：";
			temp.color = 0x99915C;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 0;
			temp.y = 97;
			return temp;
		}

		private function lbl_t6_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbl_t6 = temp;
			temp.name = "lbl_t6";
			temp.letterSpacing = -1;
			temp.text = "内功：";
			temp.color = 0x99915C;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 0;
			temp.y = 117;
			return temp;
		}

		private function lbl_t7_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbl_t7 = temp;
			temp.name = "lbl_t7";
			temp.letterSpacing = -1;
			temp.text = "攻速：";
			temp.color = 0xA79F4F;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 0;
			temp.y = 136;
			return temp;
		}

		private function lbl_t8_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbl_t8 = temp;
			temp.name = "lbl_t8";
			temp.letterSpacing = -1;
			temp.text = "命中率：";
			temp.color = 0xA79F4F;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 0;
			temp.y = 156;
			return temp;
		}

		private function lbl_t9_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbl_t9 = temp;
			temp.name = "lbl_t9";
			temp.letterSpacing = -1;
			temp.text = "暴击抗性：";
			temp.color = 0xA79F4F;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 0;
			temp.y = 175;
			return temp;
		}

		private function lbl_zq_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbl_zq = temp;
			temp.name = "lbl_zq";
			temp.fontSize = 13;
			temp.text = "真气：";
			temp.color = 0xABAD97;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 11;
			temp.y = 87;
			return temp;
		}

		private function mIcon0_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			mIcon0 = temp;
			temp.name = "mIcon0";
			temp.styleName = "ui/common/tubiao/yinzi_24.png";
			temp.x = 131;
			temp.y = 0;
			return temp;
		}

		private function mIcon1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			mIcon1 = temp;
			temp.name = "mIcon1";
			temp.styleName = "ui/common/tubiao/yinzib_24.png";
			temp.x = 294;
			temp.y = 0;
			return temp;
		}

		private function mIcon2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			mIcon2 = temp;
			temp.name = "mIcon2";
			temp.styleName = "ui/common/tubiao/yuanbao_24.png";
			temp.x = 131;
			temp.y = 27;
			return temp;
		}

		private function mIcon3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			mIcon3 = temp;
			temp.name = "mIcon3";
			temp.styleName = "ui/common/tubiao/lijin_24.png";
			temp.x = 294;
			temp.y = 27;
			return temp;
		}

		private function money_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			money = temp;
			temp.name = "money";
			temp.x = 12;
			temp.y = 349;
			temp.elementsContent = [__beibao_Skin_UIAsset14_i(),__beibao_Skin_UIAsset15_i(),__beibao_Skin_UIAsset16_i(),__beibao_Skin_UIAsset17_i(),txt0_i(),txt2_i(),txt1_i(),txt3_i(),mIcon0_i(),mIcon2_i(),mIcon1_i(),mIcon3_i()];
			return temp;
		}

		private function packs_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			packs = temp;
			temp.name = "packs";
			temp.x = 588;
			temp.y = 74;
			temp.elementsContent = [__beibao_Skin_UIAsset9_i(),__beibao_Skin_UIAsset10_i(),__beibao_Skin_UIAsset11_i(),__beibao_Skin_UIAsset12_i(),__beibao_Skin_UIAsset13_i(),tab_pack_i(),money_i(),Icons_i(),vs_Bar_i()];
			return temp;
		}

		private function pro_jinyan_i():feathers.controls.ProgressBar
		{
			var temp:feathers.controls.ProgressBar = new feathers.controls.ProgressBar();
			pro_jinyan = temp;
			temp.name = "pro_jinyan";
			temp.height = 13;
			temp.styleClass = org.mokylin.skin.component.progress.progress_role1_Skin;
			temp.value = 0;
			temp.x = 48;
			temp.y = 77;
			return temp;
		}

		private function pro_zhenqi_i():feathers.controls.ProgressBar
		{
			var temp:feathers.controls.ProgressBar = new feathers.controls.ProgressBar();
			pro_zhenqi = temp;
			temp.name = "pro_zhenqi";
			temp.height = 11;
			temp.styleClass = org.mokylin.skin.component.progress.progress_role2_Skin;
			temp.value = 0;
			temp.width = 131;
			temp.x = 48;
			temp.y = 95;
			return temp;
		}

		private function tab_pack_i():feathers.controls.TabBar
		{
			var temp:feathers.controls.TabBar = new feathers.controls.TabBar();
			tab_pack = temp;
			temp.name = "tab_pack";
			temp.btnWidth = 65;
			temp.height = 30;
			temp.styleClass = org.mokylin.skin.component.tabbar.TabBarSkin_pack;
			temp.width = 326;
			temp.x = 9;
			temp.y = 0;
			temp.layout = __beibao_Skin_HorizontalLayout1_i();
			temp.dataProvider = __beibao_Skin_ArrayCollection1_i();
			return temp;
		}

		private function txt0_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			txt0 = temp;
			temp.name = "txt0";
			temp.text = "1000";
			temp.textAlign = "right";
			temp.color = 0xE3D9BF;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 116;
			temp.x = 2;
			temp.y = 0;
			return temp;
		}

		private function txt1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			txt1 = temp;
			temp.name = "txt1";
			temp.text = "1000";
			temp.textAlign = "right";
			temp.color = 0xE3D9BF;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 116;
			temp.x = 172;
			temp.y = 0;
			return temp;
		}

		private function txt2_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			txt2 = temp;
			temp.name = "txt2";
			temp.text = "1000";
			temp.textAlign = "right";
			temp.color = 0xE3D9BF;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 116;
			temp.x = 2;
			temp.y = 25;
			return temp;
		}

		private function txt3_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			txt3 = temp;
			temp.name = "txt3";
			temp.text = "1000";
			temp.textAlign = "right";
			temp.color = 0xE3D9BF;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 116;
			temp.x = 172;
			temp.y = 25;
			return temp;
		}

		private function txt_cur_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			txt_cur = temp;
			temp.name = "txt_cur";
			temp.bold = true;
			temp.fontSize = 18;
			temp.text = "64777777";
			temp.color = 0xF2B13B;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 78;
			temp.y = 27;
			return temp;
		}

		private function txt_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			txt = temp;
			temp.name = "txt";
			temp.x = 70;
			temp.y = 110;
			temp.elementsContent = [txt_t0_i(),txt_t1_i(),txt_t2_i(),txt_t3_i(),txt_t4_i(),txt_t5_i(),txt_t6_i(),txt_t7_i(),txt_t8_i(),txt_t9_i(),txt_t10_i(),txt_t11_i(),txt_t12_i(),txt_t13_i(),txt_t14_i(),txt_t15_i()];
			return temp;
		}

		private function txt_jinyan_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			txt_jinyan = temp;
			temp.name = "txt_jinyan";
			temp.fontSize = 12;
			temp.text = "1254/2544";
			temp.textAlign = "center";
			temp.color = 0xE3D9BF;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 130;
			temp.x = 50;
			temp.y = 71;
			return temp;
		}

		private function txt_level_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			txt_level = temp;
			temp.name = "txt_level";
			temp.height = 22;
			temp.fontSize = 14;
			temp.text = "Lv3";
			temp.color = 0xABAD97;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function txt_loveName_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			txt_loveName = temp;
			temp.name = "txt_loveName";
			temp.letterSpacing = -1;
			temp.text = "名字六个字";
			temp.color = 0xABAD97;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 15;
			temp.y = 36;
			return temp;
		}

		private function txt_qu_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			txt_qu = temp;
			temp.name = "txt_qu";
			temp.height = 24;
			temp.letterSpacing = -1;
			temp.text = "[1区]";
			temp.color = 0xABAD97;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 43;
			temp.x = 111;
			temp.y = 1;
			return temp;
		}

		private function txt_roleName_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			txt_roleName = temp;
			temp.name = "txt_roleName";
			temp.bold = true;
			temp.text = "名字共六个字";
			temp.color = 0xE2C778;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 144;
			temp.y = 1;
			return temp;
		}

		private function txt_t0_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			txt_t0 = temp;
			temp.name = "txt_t0";
			temp.text = "32157";
			temp.textAlign = "right";
			temp.color = 0xE3D9BF;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 109;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function txt_t10_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			txt_t10 = temp;
			temp.name = "txt_t10";
			temp.text = "66.30%";
			temp.textAlign = "right";
			temp.color = 0xE3D9BF;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 109;
			temp.x = 0;
			temp.y = 194;
			return temp;
		}

		private function txt_t11_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			txt_t11 = temp;
			temp.name = "txt_t11";
			temp.text = "26.30%";
			temp.textAlign = "right";
			temp.color = 0xE3D9BF;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 109;
			temp.x = 0;
			temp.y = 213;
			return temp;
		}

		private function txt_t12_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			txt_t12 = temp;
			temp.name = "txt_t12";
			temp.text = "125/5秒";
			temp.textAlign = "right";
			temp.color = 0xE3D9BF;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 109;
			temp.x = 0;
			temp.y = 233;
			return temp;
		}

		private function txt_t13_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			txt_t13 = temp;
			temp.name = "txt_t13";
			temp.text = "66.30%";
			temp.textAlign = "right";
			temp.color = 0xE3D9BF;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 109;
			temp.x = 0;
			temp.y = 252;
			return temp;
		}

		private function txt_t14_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			txt_t14 = temp;
			temp.name = "txt_t14";
			temp.text = "26.30%";
			temp.textAlign = "right";
			temp.color = 0xE3D9BF;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 109;
			temp.x = 0;
			temp.y = 272;
			return temp;
		}

		private function txt_t15_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			txt_t15 = temp;
			temp.name = "txt_t15";
			temp.text = "26.30%";
			temp.textAlign = "right";
			temp.color = 0xE3D9BF;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 109;
			temp.x = 0;
			temp.y = 291;
			return temp;
		}

		private function txt_t1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			txt_t1 = temp;
			temp.name = "txt_t1";
			temp.text = "32157";
			temp.textAlign = "right";
			temp.color = 0xE3D9BF;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 109;
			temp.x = 0;
			temp.y = 19;
			return temp;
		}

		private function txt_t2_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			txt_t2 = temp;
			temp.name = "txt_t2";
			temp.text = "32157";
			temp.textAlign = "right";
			temp.color = 0xE3D9BF;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 109;
			temp.x = 0;
			temp.y = 39;
			return temp;
		}

		private function txt_t3_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			txt_t3 = temp;
			temp.name = "txt_t3";
			temp.text = "32157";
			temp.textAlign = "right";
			temp.color = 0xE3D9BF;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 109;
			temp.x = 0;
			temp.y = 58;
			return temp;
		}

		private function txt_t4_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			txt_t4 = temp;
			temp.name = "txt_t4";
			temp.text = "47732157";
			temp.textAlign = "right";
			temp.color = 0xE3D9BF;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 109;
			temp.x = 0;
			temp.y = 78;
			return temp;
		}

		private function txt_t5_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			txt_t5 = temp;
			temp.name = "txt_t5";
			temp.text = "5272";
			temp.textAlign = "right";
			temp.color = 0xE3D9BF;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 109;
			temp.x = 0;
			temp.y = 97;
			return temp;
		}

		private function txt_t6_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			txt_t6 = temp;
			temp.name = "txt_t6";
			temp.text = "5272";
			temp.textAlign = "right";
			temp.color = 0xE3D9BF;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 109;
			temp.x = 0;
			temp.y = 116;
			return temp;
		}

		private function txt_t7_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			txt_t7 = temp;
			temp.name = "txt_t7";
			temp.text = "125/5秒";
			temp.textAlign = "right";
			temp.color = 0xE3D9BF;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 109;
			temp.x = 0;
			temp.y = 136;
			return temp;
		}

		private function txt_t8_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			txt_t8 = temp;
			temp.name = "txt_t8";
			temp.text = "66.30%";
			temp.textAlign = "right";
			temp.color = 0xE3D9BF;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 109;
			temp.x = 0;
			temp.y = 155;
			return temp;
		}

		private function txt_t9_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			txt_t9 = temp;
			temp.name = "txt_t9";
			temp.text = "66.30%";
			temp.textAlign = "right";
			temp.color = 0xE3D9BF;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 109;
			temp.x = 0;
			temp.y = 175;
			return temp;
		}

		private function txt_team_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			txt_team = temp;
			temp.name = "txt_team";
			temp.letterSpacing = -1;
			temp.text = "[帮会名字]";
			temp.color = 0xABAD97;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 149;
			temp.y = 21;
			return temp;
		}

		private function txt_type_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			txt_type = temp;
			temp.name = "txt_type";
			temp.letterSpacing = -1;
			temp.text = "兵家";
			temp.color = 0xABAD97;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 0;
			temp.y = 17;
			return temp;
		}

		private function txt_zhenqi_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			txt_zhenqi = temp;
			temp.name = "txt_zhenqi";
			temp.fontSize = 12;
			temp.text = "1254/2544";
			temp.textAlign = "center";
			temp.color = 0xE3D9BF;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 130;
			temp.x = 50;
			temp.y = 89;
			return temp;
		}

		private function values_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			values = temp;
			temp.name = "values";
			temp.x = 27;
			temp.y = 75;
			temp.elementsContent = [__beibao_Skin_UIAsset8_i(),__beibao_Skin_Label1_i(),__beibao_Skin_Label2_i(),txt_cur_i(),__beibao_Skin_Label3_i(),lbl_jy_i(),lbl_zq_i(),pro_jinyan_i(),pro_zhenqi_i(),txt_jinyan_i(),txt_zhenqi_i(),__beibao_Skin_Group1_i(),txt_i()];
			return temp;
		}

		private function vs_Bar_i():feathers.controls.ScrollContainer
		{
			var temp:feathers.controls.ScrollContainer = new feathers.controls.ScrollContainer();
			vs_Bar = temp;
			temp.name = "vs_Bar";
			temp.height = 314;
			temp.styleClass = org.mokylin.skin.component.scrollbar.ScrollBarSkin_pack;
			temp.x = 320;
			temp.y = 31;
			return temp;
		}

		private function weapons_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			weapons = temp;
			temp.name = "weapons";
			temp.height = 296;
			temp.width = 344;
			temp.x = 232;
			temp.y = 159;
			temp.elementsContent = [__beibao_Skin_UIAsset3_i(),__beibao_Skin_UIAsset4_i(),Icbg0_i(),Icbg5_i(),Icbg1_i(),Icbg6_i(),Icbg2_i(),Icbg7_i(),Icbg3_i(),Icbg8_i(),Icbg4_i(),Icbg9_i()];
			return temp;
		}

	}
}