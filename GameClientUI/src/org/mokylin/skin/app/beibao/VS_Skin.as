package org.mokylin.skin.app.beibao
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Group;
	import feathers.controls.Label;
	import feathers.controls.ProgressBar;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import feathers.controls.UINumber;
	import org.mokylin.skin.component.progress.pro_vs1_Skin;
	import org.mokylin.skin.component.progress.pro_vs2_Skin;
	import org.mokylin.skin.component.uinumber.UINumberSkin_zhandouli_yellow2;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class VS_Skin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var grp_dj:feathers.controls.Group;

		public var grp_jm:feathers.controls.Group;

		public var grp_jn:feathers.controls.Group;

		public var grp_jx:feathers.controls.Group;

		public var grp_lj:feathers.controls.Group;

		public var grp_ms:feathers.controls.Group;

		public var grp_xf:feathers.controls.Group;

		public var grp_zb:feathers.controls.Group;

		public var grp_zq:feathers.controls.Group;

		public var lb_dj_other:feathers.controls.Label;

		public var lb_dj_own:feathers.controls.Label;

		public var lb_jm_other:feathers.controls.Label;

		public var lb_jm_own:feathers.controls.Label;

		public var lb_jn_other:feathers.controls.Label;

		public var lb_jn_own:feathers.controls.Label;

		public var lb_mr_other:feathers.controls.Label;

		public var lb_mr_own:feathers.controls.Label;

		public var lb_ms_other:feathers.controls.Label;

		public var lb_ms_own:feathers.controls.Label;

		public var lb_other:feathers.controls.Label;

		public var lb_own:feathers.controls.Label;

		public var lb_xf_other:feathers.controls.Label;

		public var lb_xf_own:feathers.controls.Label;

		public var lb_zb_other:feathers.controls.Label;

		public var lb_zb_own:feathers.controls.Label;

		public var lb_zq_other:feathers.controls.Label;

		public var lb_zq_own:feathers.controls.Label;

		public var lb_zqi_other:feathers.controls.Label;

		public var lb_zqi_own:feathers.controls.Label;

		public var num_other:feathers.controls.UINumber;

		public var num_own:feathers.controls.UINumber;

		public var pro_dj_other:feathers.controls.ProgressBar;

		public var pro_dj_own:feathers.controls.ProgressBar;

		public var pro_jm_other:feathers.controls.ProgressBar;

		public var pro_jm_own:feathers.controls.ProgressBar;

		public var pro_jn_other:feathers.controls.ProgressBar;

		public var pro_jn_own:feathers.controls.ProgressBar;

		public var pro_mr_other:feathers.controls.ProgressBar;

		public var pro_mr_own:feathers.controls.ProgressBar;

		public var pro_ms_other:feathers.controls.ProgressBar;

		public var pro_ms_own:feathers.controls.ProgressBar;

		public var pro_xf_other:feathers.controls.ProgressBar;

		public var pro_xf_own:feathers.controls.ProgressBar;

		public var pro_zb_other:feathers.controls.ProgressBar;

		public var pro_zb_own:feathers.controls.ProgressBar;

		public var pro_zq_other:feathers.controls.ProgressBar;

		public var pro_zq_own:feathers.controls.ProgressBar;

		public var pro_zqi_other:feathers.controls.ProgressBar;

		public var pro_zqi_own:feathers.controls.ProgressBar;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function VS_Skin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 457;
			this.width = 343;
			this.elementsContent = [__VS_Skin_UIAsset1_i(),lb_own_i(),lb_other_i(),num_own_i(),num_other_i(),grp_ms_i(),grp_dj_i(),grp_zq_i(),grp_zb_i(),grp_xf_i(),grp_jn_i(),grp_jm_i(),grp_jx_i(),grp_lj_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __VS_Skin_UIAsset10_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/beibao/vs/9.png";
			temp.x = 128;
			temp.y = 20;
			return temp;
		}

		private function __VS_Skin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/big_bg/beibao/vs/bg.png";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function __VS_Skin_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/beibao/vs/1.png";
			temp.x = 128;
			temp.y = 19;
			return temp;
		}

		private function __VS_Skin_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/beibao/vs/2.png";
			temp.x = 128;
			temp.y = 17;
			return temp;
		}

		private function __VS_Skin_UIAsset4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/beibao/vs/3.png";
			temp.x = 128;
			temp.y = 19;
			return temp;
		}

		private function __VS_Skin_UIAsset5_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/beibao/vs/4.png";
			temp.x = 128;
			temp.y = 19;
			return temp;
		}

		private function __VS_Skin_UIAsset6_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/beibao/vs/5.png";
			temp.x = 128;
			temp.y = 18;
			return temp;
		}

		private function __VS_Skin_UIAsset7_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/beibao/vs/6.png";
			temp.x = 128;
			temp.y = 20;
			return temp;
		}

		private function __VS_Skin_UIAsset8_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/beibao/vs/7.png";
			temp.x = 128;
			temp.y = 18;
			return temp;
		}

		private function __VS_Skin_UIAsset9_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/beibao/vs/8.png";
			temp.x = 128;
			temp.y = 20;
			return temp;
		}

		private function grp_dj_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			grp_dj = temp;
			temp.name = "grp_dj";
			temp.x = 20;
			temp.y = 137;
			temp.elementsContent = [pro_dj_other_i(),pro_dj_own_i(),lb_dj_own_i(),lb_dj_other_i(),__VS_Skin_UIAsset3_i()];
			return temp;
		}

		private function grp_jm_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			grp_jm = temp;
			temp.name = "grp_jm";
			temp.x = 20;
			temp.y = 322;
			temp.elementsContent = [pro_xf_other_i(),pro_xf_own_i(),lb_xf_own_i(),lb_xf_other_i(),__VS_Skin_UIAsset8_i()];
			return temp;
		}

		private function grp_jn_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			grp_jn = temp;
			temp.name = "grp_jn";
			temp.x = 20;
			temp.y = 285;
			temp.elementsContent = [pro_jm_other_i(),pro_jm_own_i(),lb_jm_own_i(),lb_jm_other_i(),__VS_Skin_UIAsset7_i()];
			return temp;
		}

		private function grp_jx_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			grp_jx = temp;
			temp.name = "grp_jx";
			temp.x = 20;
			temp.y = 358;
			temp.elementsContent = [pro_jn_other_i(),pro_jn_own_i(),lb_jn_own_i(),lb_jn_other_i(),__VS_Skin_UIAsset9_i()];
			return temp;
		}

		private function grp_lj_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			grp_lj = temp;
			temp.name = "grp_lj";
			temp.x = 20;
			temp.y = 395;
			temp.elementsContent = [pro_mr_other_i(),pro_mr_own_i(),lb_mr_own_i(),lb_mr_other_i(),__VS_Skin_UIAsset10_i()];
			return temp;
		}

		private function grp_ms_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			grp_ms = temp;
			temp.name = "grp_ms";
			temp.x = 20;
			temp.y = 100;
			temp.elementsContent = [pro_ms_other_i(),pro_ms_own_i(),lb_ms_own_i(),lb_ms_other_i(),__VS_Skin_UIAsset2_i()];
			return temp;
		}

		private function grp_xf_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			grp_xf = temp;
			temp.name = "grp_xf";
			temp.x = 20;
			temp.y = 248;
			temp.elementsContent = [pro_zqi_other_i(),pro_zqi_own_i(),lb_zqi_own_i(),lb_zqi_other_i(),__VS_Skin_UIAsset6_i()];
			return temp;
		}

		private function grp_zb_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			grp_zb = temp;
			temp.name = "grp_zb";
			temp.x = 20;
			temp.y = 212;
			temp.elementsContent = [pro_zq_other_i(),pro_zq_own_i(),lb_zq_own_i(),lb_zq_other_i(),__VS_Skin_UIAsset5_i()];
			return temp;
		}

		private function grp_zq_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			grp_zq = temp;
			temp.name = "grp_zq";
			temp.x = 20;
			temp.y = 174;
			temp.elementsContent = [pro_zb_other_i(),pro_zb_own_i(),lb_zb_own_i(),lb_zb_other_i(),__VS_Skin_UIAsset4_i()];
			return temp;
		}

		private function lb_dj_other_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lb_dj_other = temp;
			temp.name = "lb_dj_other";
			temp.text = "47";
			temp.textAlign = "center";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 117;
			temp.x = 194;
			temp.y = 0;
			return temp;
		}

		private function lb_dj_own_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lb_dj_own = temp;
			temp.name = "lb_dj_own";
			temp.text = "50";
			temp.textAlign = "center";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 117;
			temp.x = 2;
			temp.y = 0;
			return temp;
		}

		private function lb_jm_other_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lb_jm_other = temp;
			temp.name = "lb_jm_other";
			temp.text = "6644";
			temp.textAlign = "center";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 117;
			temp.x = 194;
			temp.y = 0;
			return temp;
		}

		private function lb_jm_own_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lb_jm_own = temp;
			temp.name = "lb_jm_own";
			temp.text = "3300";
			temp.textAlign = "center";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 117;
			temp.x = 2;
			temp.y = 0;
			return temp;
		}

		private function lb_jn_other_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lb_jn_other = temp;
			temp.name = "lb_jn_other";
			temp.text = "2345";
			temp.textAlign = "center";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 117;
			temp.x = 194;
			temp.y = 0;
			return temp;
		}

		private function lb_jn_own_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lb_jn_own = temp;
			temp.name = "lb_jn_own";
			temp.text = "1234";
			temp.textAlign = "center";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 117;
			temp.x = 2;
			temp.y = 0;
			return temp;
		}

		private function lb_mr_other_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lb_mr_other = temp;
			temp.name = "lb_mr_other";
			temp.text = "2345";
			temp.textAlign = "center";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 117;
			temp.x = 194;
			temp.y = 0;
			return temp;
		}

		private function lb_mr_own_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lb_mr_own = temp;
			temp.name = "lb_mr_own";
			temp.text = "1234";
			temp.textAlign = "center";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 117;
			temp.x = 2;
			temp.y = 0;
			return temp;
		}

		private function lb_ms_other_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lb_ms_other = temp;
			temp.name = "lb_ms_other";
			temp.text = "388888888";
			temp.textAlign = "center";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 117;
			temp.x = 194;
			temp.y = 0;
			return temp;
		}

		private function lb_ms_own_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lb_ms_own = temp;
			temp.name = "lb_ms_own";
			temp.text = "377777770";
			temp.textAlign = "center";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 117;
			temp.x = 2;
			temp.y = 0;
			return temp;
		}

		private function lb_other_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lb_other = temp;
			temp.name = "lb_other";
			temp.text = "名字共六个字";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 226;
			temp.y = 25;
			return temp;
		}

		private function lb_own_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lb_own = temp;
			temp.name = "lb_own";
			temp.text = "名字共六个字";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 35;
			temp.y = 25;
			return temp;
		}

		private function lb_xf_other_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lb_xf_other = temp;
			temp.name = "lb_xf_other";
			temp.text = "190";
			temp.textAlign = "center";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 117;
			temp.x = 194;
			temp.y = 0;
			return temp;
		}

		private function lb_xf_own_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lb_xf_own = temp;
			temp.name = "lb_xf_own";
			temp.text = "970";
			temp.textAlign = "center";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 117;
			temp.x = 2;
			temp.y = 0;
			return temp;
		}

		private function lb_zb_other_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lb_zb_other = temp;
			temp.name = "lb_zb_other";
			temp.text = "1780";
			temp.textAlign = "center";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 117;
			temp.x = 194;
			temp.y = 0;
			return temp;
		}

		private function lb_zb_own_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lb_zb_own = temp;
			temp.name = "lb_zb_own";
			temp.text = "2300";
			temp.textAlign = "center";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 117;
			temp.x = 2;
			temp.y = 0;
			return temp;
		}

		private function lb_zq_other_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lb_zq_other = temp;
			temp.name = "lb_zq_other";
			temp.text = "4700";
			temp.textAlign = "center";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 117;
			temp.x = 194;
			temp.y = 0;
			return temp;
		}

		private function lb_zq_own_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lb_zq_own = temp;
			temp.name = "lb_zq_own";
			temp.text = "2300";
			temp.textAlign = "center";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 117;
			temp.x = 2;
			temp.y = 0;
			return temp;
		}

		private function lb_zqi_other_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lb_zqi_other = temp;
			temp.name = "lb_zqi_other";
			temp.text = "4700";
			temp.textAlign = "center";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 117;
			temp.x = 194;
			temp.y = 0;
			return temp;
		}

		private function lb_zqi_own_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lb_zqi_own = temp;
			temp.name = "lb_zqi_own";
			temp.text = "2300";
			temp.textAlign = "center";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 117;
			temp.x = 2;
			temp.y = 0;
			return temp;
		}

		private function num_other_i():feathers.controls.UINumber
		{
			var temp:feathers.controls.UINumber = new feathers.controls.UINumber();
			num_other = temp;
			temp.name = "num_other";
			temp.gap = -14;
			temp.height = 25;
			temp.label = "6521478";
			temp.styleClass = org.mokylin.skin.component.uinumber.UINumberSkin_zhandouli_yellow2;
			temp.width = 103;
			temp.x = 223;
			temp.y = 52;
			return temp;
		}

		private function num_own_i():feathers.controls.UINumber
		{
			var temp:feathers.controls.UINumber = new feathers.controls.UINumber();
			num_own = temp;
			temp.name = "num_own";
			temp.gap = -14;
			temp.height = 25;
			temp.label = "6521478";
			temp.styleClass = org.mokylin.skin.component.uinumber.UINumberSkin_zhandouli_yellow2;
			temp.width = 96;
			temp.x = 30;
			temp.y = 52;
			return temp;
		}

		private function pro_dj_other_i():feathers.controls.ProgressBar
		{
			var temp:feathers.controls.ProgressBar = new feathers.controls.ProgressBar();
			pro_dj_other = temp;
			temp.name = "pro_dj_other";
			temp.height = 19;
			temp.minimum = 0;
			temp.styleClass = org.mokylin.skin.component.progress.pro_vs1_Skin;
			temp.value = 50;
			temp.width = 120;
			temp.x = 194;
			temp.y = 18;
			return temp;
		}

		private function pro_dj_own_i():feathers.controls.ProgressBar
		{
			var temp:feathers.controls.ProgressBar = new feathers.controls.ProgressBar();
			pro_dj_own = temp;
			temp.name = "pro_dj_own";
			temp.height = 19;
			temp.styleClass = org.mokylin.skin.component.progress.pro_vs2_Skin;
			temp.value = 0;
			temp.width = 120;
			temp.x = 0;
			temp.y = 18;
			return temp;
		}

		private function pro_jm_other_i():feathers.controls.ProgressBar
		{
			var temp:feathers.controls.ProgressBar = new feathers.controls.ProgressBar();
			pro_jm_other = temp;
			temp.name = "pro_jm_other";
			temp.height = 19;
			temp.minimum = 0;
			temp.styleClass = org.mokylin.skin.component.progress.pro_vs1_Skin;
			temp.value = 50;
			temp.width = 120;
			temp.x = 194;
			temp.y = 18;
			return temp;
		}

		private function pro_jm_own_i():feathers.controls.ProgressBar
		{
			var temp:feathers.controls.ProgressBar = new feathers.controls.ProgressBar();
			pro_jm_own = temp;
			temp.name = "pro_jm_own";
			temp.height = 19;
			temp.styleClass = org.mokylin.skin.component.progress.pro_vs2_Skin;
			temp.value = 0;
			temp.width = 120;
			temp.x = 0;
			temp.y = 18;
			return temp;
		}

		private function pro_jn_other_i():feathers.controls.ProgressBar
		{
			var temp:feathers.controls.ProgressBar = new feathers.controls.ProgressBar();
			pro_jn_other = temp;
			temp.name = "pro_jn_other";
			temp.height = 19;
			temp.minimum = 0;
			temp.styleClass = org.mokylin.skin.component.progress.pro_vs1_Skin;
			temp.value = 50;
			temp.width = 120;
			temp.x = 194;
			temp.y = 18;
			return temp;
		}

		private function pro_jn_own_i():feathers.controls.ProgressBar
		{
			var temp:feathers.controls.ProgressBar = new feathers.controls.ProgressBar();
			pro_jn_own = temp;
			temp.name = "pro_jn_own";
			temp.height = 19;
			temp.styleClass = org.mokylin.skin.component.progress.pro_vs2_Skin;
			temp.value = 0;
			temp.width = 120;
			temp.x = 0;
			temp.y = 18;
			return temp;
		}

		private function pro_mr_other_i():feathers.controls.ProgressBar
		{
			var temp:feathers.controls.ProgressBar = new feathers.controls.ProgressBar();
			pro_mr_other = temp;
			temp.name = "pro_mr_other";
			temp.height = 19;
			temp.minimum = 0;
			temp.styleClass = org.mokylin.skin.component.progress.pro_vs1_Skin;
			temp.value = 50;
			temp.width = 120;
			temp.x = 194;
			temp.y = 18;
			return temp;
		}

		private function pro_mr_own_i():feathers.controls.ProgressBar
		{
			var temp:feathers.controls.ProgressBar = new feathers.controls.ProgressBar();
			pro_mr_own = temp;
			temp.name = "pro_mr_own";
			temp.height = 19;
			temp.styleClass = org.mokylin.skin.component.progress.pro_vs2_Skin;
			temp.value = 10;
			temp.width = 120;
			temp.x = 0;
			temp.y = 18;
			return temp;
		}

		private function pro_ms_other_i():feathers.controls.ProgressBar
		{
			var temp:feathers.controls.ProgressBar = new feathers.controls.ProgressBar();
			pro_ms_other = temp;
			temp.name = "pro_ms_other";
			temp.height = 19;
			temp.minimum = 0;
			temp.styleClass = org.mokylin.skin.component.progress.pro_vs1_Skin;
			temp.value = 50;
			temp.width = 120;
			temp.x = 194;
			temp.y = 18;
			return temp;
		}

		private function pro_ms_own_i():feathers.controls.ProgressBar
		{
			var temp:feathers.controls.ProgressBar = new feathers.controls.ProgressBar();
			pro_ms_own = temp;
			temp.name = "pro_ms_own";
			temp.height = 19;
			temp.styleClass = org.mokylin.skin.component.progress.pro_vs2_Skin;
			temp.value = 50;
			temp.width = 120;
			temp.x = 0;
			temp.y = 18;
			return temp;
		}

		private function pro_xf_other_i():feathers.controls.ProgressBar
		{
			var temp:feathers.controls.ProgressBar = new feathers.controls.ProgressBar();
			pro_xf_other = temp;
			temp.name = "pro_xf_other";
			temp.height = 19;
			temp.minimum = 0;
			temp.styleClass = org.mokylin.skin.component.progress.pro_vs1_Skin;
			temp.value = 50;
			temp.width = 120;
			temp.x = 194;
			temp.y = 18;
			return temp;
		}

		private function pro_xf_own_i():feathers.controls.ProgressBar
		{
			var temp:feathers.controls.ProgressBar = new feathers.controls.ProgressBar();
			pro_xf_own = temp;
			temp.name = "pro_xf_own";
			temp.height = 19;
			temp.styleClass = org.mokylin.skin.component.progress.pro_vs2_Skin;
			temp.value = 0;
			temp.width = 120;
			temp.x = 0;
			temp.y = 18;
			return temp;
		}

		private function pro_zb_other_i():feathers.controls.ProgressBar
		{
			var temp:feathers.controls.ProgressBar = new feathers.controls.ProgressBar();
			pro_zb_other = temp;
			temp.name = "pro_zb_other";
			temp.height = 19;
			temp.minimum = 0;
			temp.styleClass = org.mokylin.skin.component.progress.pro_vs1_Skin;
			temp.value = 50;
			temp.width = 120;
			temp.x = 194;
			temp.y = 18;
			return temp;
		}

		private function pro_zb_own_i():feathers.controls.ProgressBar
		{
			var temp:feathers.controls.ProgressBar = new feathers.controls.ProgressBar();
			pro_zb_own = temp;
			temp.name = "pro_zb_own";
			temp.height = 19;
			temp.styleClass = org.mokylin.skin.component.progress.pro_vs2_Skin;
			temp.value = 0;
			temp.width = 120;
			temp.x = 0;
			temp.y = 18;
			return temp;
		}

		private function pro_zq_other_i():feathers.controls.ProgressBar
		{
			var temp:feathers.controls.ProgressBar = new feathers.controls.ProgressBar();
			pro_zq_other = temp;
			temp.name = "pro_zq_other";
			temp.height = 19;
			temp.minimum = 0;
			temp.styleClass = org.mokylin.skin.component.progress.pro_vs1_Skin;
			temp.value = 50;
			temp.width = 120;
			temp.x = 194;
			temp.y = 18;
			return temp;
		}

		private function pro_zq_own_i():feathers.controls.ProgressBar
		{
			var temp:feathers.controls.ProgressBar = new feathers.controls.ProgressBar();
			pro_zq_own = temp;
			temp.name = "pro_zq_own";
			temp.height = 19;
			temp.styleClass = org.mokylin.skin.component.progress.pro_vs2_Skin;
			temp.value = 0;
			temp.width = 120;
			temp.x = 0;
			temp.y = 18;
			return temp;
		}

		private function pro_zqi_other_i():feathers.controls.ProgressBar
		{
			var temp:feathers.controls.ProgressBar = new feathers.controls.ProgressBar();
			pro_zqi_other = temp;
			temp.name = "pro_zqi_other";
			temp.height = 19;
			temp.minimum = 0;
			temp.styleClass = org.mokylin.skin.component.progress.pro_vs1_Skin;
			temp.value = 50;
			temp.width = 120;
			temp.x = 194;
			temp.y = 18;
			return temp;
		}

		private function pro_zqi_own_i():feathers.controls.ProgressBar
		{
			var temp:feathers.controls.ProgressBar = new feathers.controls.ProgressBar();
			pro_zqi_own = temp;
			temp.name = "pro_zqi_own";
			temp.height = 19;
			temp.styleClass = org.mokylin.skin.component.progress.pro_vs2_Skin;
			temp.value = 0;
			temp.width = 120;
			temp.x = 0;
			temp.y = 18;
			return temp;
		}

	}
}