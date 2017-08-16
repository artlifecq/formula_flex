package org.mokylin.skin.app.zhuangbei.hecheng
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Button;
	import feathers.controls.Group;
	import feathers.controls.Label;
	import feathers.controls.Radio;
	import feathers.controls.SkinnableContainer;
	import feathers.controls.StateSkin;
	import feathers.controls.TextInput;
	import feathers.controls.Tree;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.component.button.ButtonSkin_info;
	import org.mokylin.skin.component.button.ButtonSkin_jia;
	import org.mokylin.skin.component.button.ButtonSkin_jian;
	import org.mokylin.skin.component.button.ButtonSkin_putong2;
	import org.mokylin.skin.component.button.ButtonSkin_putongMax;
	import org.mokylin.skin.component.text.textInput3_Skin;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class HeCheng_Skin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var btnMax:feathers.controls.Button;

		public var btn_hecheng:feathers.controls.Button;

		public var btn_max:feathers.controls.Button;

		public var btn_min:feathers.controls.Button;

		public var btn_shuoming:feathers.controls.Button;

		public var btns:feathers.controls.Group;

		public var cailiao1:feathers.controls.UIAsset;

		public var cailiao2:feathers.controls.UIAsset;

		public var cailiao3:feathers.controls.UIAsset;

		public var exist1:feathers.controls.UIAsset;

		public var exist2:feathers.controls.UIAsset;

		public var exist3:feathers.controls.UIAsset;

		public var exist4:feathers.controls.UIAsset;

		public var grp_cailiao:feathers.controls.Group;

		public var grp_exit:feathers.controls.Group;

		public var input_txt:feathers.controls.TextInput;

		public var lbCailiao1:feathers.controls.Label;

		public var lbCailiao2:feathers.controls.Label;

		public var lbCailiao3:feathers.controls.Label;

		public var lbEnd:feathers.controls.Label;

		public var lb_msg:feathers.controls.Label;

		public var tree:feathers.controls.Tree;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function HeCheng_Skin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 601;
			this.width = 956;
			this.elementsContent = [__HeCheng_Skin_UIAsset2_i(),__HeCheng_Skin_UIAsset3_i(),__HeCheng_Skin_UIAsset4_i(),btn_shuoming_i(),grp_exit_i(),btns_i(),btn_hecheng_i(),lb_msg_i(),__HeCheng_Skin_UIAsset9_i(),tree_i(),__HeCheng_Skin_UIAsset10_i(),lbEnd_i(),__HeCheng_Skin_Group1_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __HeCheng_Skin_Group1_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			temp.height = 64;
			temp.width = 64;
			temp.x = 574;
			temp.y = 145;
			return temp;
		}

		private function __HeCheng_Skin_UIAsset10_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/zhuangbei/daojukuang.png";
			temp.x = 558;
			temp.y = 130;
			return temp;
		}

		private function __HeCheng_Skin_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 445;
			temp.styleName = "ui/common/background/neikuang_2.png";
			temp.width = 266;
			temp.x = 23;
			temp.y = 85;
			return temp;
		}

		private function __HeCheng_Skin_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 445;
			temp.styleName = "ui/common/background/neikuang_2.png";
			temp.width = 645;
			temp.x = 290;
			temp.y = 85;
			return temp;
		}

		private function __HeCheng_Skin_UIAsset4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/big_bg/zhuangbei/hecheng/bg.jpg";
			temp.x = 292;
			temp.y = 87;
			return temp;
		}

		private function __HeCheng_Skin_UIAsset5_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/zhuangbei/hecheng/wenzidi.png";
			temp.x = 0;
			temp.y = 59;
			return temp;
		}

		private function __HeCheng_Skin_UIAsset6_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/zhuangbei/hecheng/wenzidi.png";
			temp.x = 91;
			temp.y = 59;
			return temp;
		}

		private function __HeCheng_Skin_UIAsset7_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/zhuangbei/hecheng/wenzidi.png";
			temp.x = 187;
			temp.y = 59;
			return temp;
		}

		private function __HeCheng_Skin_UIAsset8_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/zhuangbei/hecheng/hcsl.png";
			temp.x = 1;
			temp.y = 5;
			return temp;
		}

		private function __HeCheng_Skin_UIAsset9_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/zhuangbei/hecheng/bchcxh.png";
			temp.x = 554;
			temp.y = 506;
			return temp;
		}

		private function btnMax_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnMax = temp;
			temp.name = "btnMax";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_putongMax;
			temp.x = 193;
			temp.y = 3;
			return temp;
		}

		private function btn_hecheng_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_hecheng = temp;
			temp.name = "btn_hecheng";
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.label = "合 成";
			temp.fontSize = 16;
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_putong2;
			temp.color = 0xEAEABC;
			temp.width = 110;
			temp.x = 568;
			temp.y = 464;
			return temp;
		}

		private function btn_max_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_max = temp;
			temp.name = "btn_max";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_jia;
			temp.x = 167;
			temp.y = 3;
			return temp;
		}

		private function btn_min_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_min = temp;
			temp.name = "btn_min";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_jian;
			temp.x = 67;
			temp.y = 3;
			return temp;
		}

		private function btn_shuoming_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_shuoming = temp;
			temp.name = "btn_shuoming";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_info;
			temp.x = 888;
			temp.y = 93;
			return temp;
		}

		private function btns_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			btns = temp;
			temp.name = "btns";
			temp.width = 182;
			temp.x = 489;
			temp.y = 432;
			temp.elementsContent = [input_txt_i(),btn_min_i(),btn_max_i(),btnMax_i(),__HeCheng_Skin_UIAsset8_i()];
			return temp;
		}

		private function cailiao1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			cailiao1 = temp;
			temp.name = "cailiao1";
			temp.styleName = "ui/common/grid/normal/48.png";
			temp.x = 16;
			temp.y = 0;
			return temp;
		}

		private function cailiao2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			cailiao2 = temp;
			temp.name = "cailiao2";
			temp.styleName = "ui/common/grid/normal/48.png";
			temp.x = 109;
			temp.y = 0;
			return temp;
		}

		private function cailiao3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			cailiao3 = temp;
			temp.name = "cailiao3";
			temp.styleName = "ui/common/grid/normal/48.png";
			temp.x = 201;
			temp.y = 0;
			return temp;
		}

		private function exist1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			exist1 = temp;
			temp.name = "exist1";
			temp.styleName = "ui/app/zhuangbei/hecheng/left.png";
			temp.x = 69;
			temp.y = 3;
			return temp;
		}

		private function exist2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			exist2 = temp;
			temp.name = "exist2";
			temp.styleName = "ui/app/zhuangbei/hecheng/center.png";
			temp.x = 162;
			temp.y = 3;
			return temp;
		}

		private function exist3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			exist3 = temp;
			temp.name = "exist3";
			temp.scaleX = -1;
			temp.styleName = "ui/app/zhuangbei/hecheng/left.png";
			temp.x = 266;
			temp.y = 5;
			return temp;
		}

		private function exist4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			exist4 = temp;
			temp.name = "exist4";
			temp.styleName = "ui/app/zhuangbei/hecheng/hecheng.png";
			temp.x = 68;
			temp.y = -35;
			return temp;
		}

		private function grp_cailiao_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			grp_cailiao = temp;
			temp.name = "grp_cailiao";
			temp.x = 30;
			temp.y = 31;
			temp.elementsContent = [__HeCheng_Skin_UIAsset5_i(),__HeCheng_Skin_UIAsset6_i(),__HeCheng_Skin_UIAsset7_i(),lbCailiao1_i(),lbCailiao2_i(),lbCailiao3_i(),cailiao1_i(),cailiao2_i(),cailiao3_i()];
			return temp;
		}

		private function grp_exit_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			grp_exit = temp;
			temp.name = "grp_exit";
			temp.x = 441;
			temp.y = 278;
			temp.elementsContent = [exist1_i(),exist2_i(),exist3_i(),exist4_i(),grp_cailiao_i()];
			return temp;
		}

		private function input_txt_i():feathers.controls.TextInput
		{
			var temp:feathers.controls.TextInput = new feathers.controls.TextInput();
			input_txt = temp;
			temp.name = "input_txt";
			temp.styleClass = org.mokylin.skin.component.text.textInput3_Skin;
			temp.textAlign = "center";
			temp.color = 0xEAEABC;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 76;
			temp.x = 90;
			temp.y = 3;
			return temp;
		}

		private function lbCailiao1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbCailiao1 = temp;
			temp.name = "lbCailiao1";
			temp.text = "合成碎片1";
			temp.textAlign = "center";
			temp.color = 0xEAEABC;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 88;
			temp.x = 0;
			temp.y = 59;
			return temp;
		}

		private function lbCailiao2_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbCailiao2 = temp;
			temp.name = "lbCailiao2";
			temp.text = "合成碎片2";
			temp.textAlign = "center";
			temp.color = 0xEAEABC;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 88;
			temp.x = 89;
			temp.y = 59;
			return temp;
		}

		private function lbCailiao3_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbCailiao3 = temp;
			temp.name = "lbCailiao3";
			temp.text = "合成碎片3";
			temp.textAlign = "center";
			temp.color = 0xEAEABC;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 88;
			temp.x = 186;
			temp.y = 59;
			return temp;
		}

		private function lbEnd_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbEnd = temp;
			temp.name = "lbEnd";
			temp.text = "初级鉴定图纸";
			temp.textAlign = "center";
			temp.color = 0x00FF33;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 103;
			temp.x = 553;
			temp.y = 106;
			return temp;
		}

		private function lb_msg_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lb_msg = temp;
			temp.name = "lb_msg";
			temp.height = 20;
			temp.text = "50";
			temp.textAlign = "left";
			temp.color = 0xBBBDAA;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 38;
			temp.x = 651;
			temp.y = 505;
			return temp;
		}

		private function tree_i():feathers.controls.Tree
		{
			var temp:feathers.controls.Tree = new feathers.controls.Tree();
			tree = temp;
			temp.name = "tree";
			temp.height = 438;
			temp.width = 262;
			temp.x = 27;
			temp.y = 88;
			return temp;
		}

	}
}