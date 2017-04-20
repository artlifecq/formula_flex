package org.mokylin.skin.app.zhuangbei.hecheng
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Button;
	import feathers.controls.Group;
	import feathers.controls.Label;
	import feathers.controls.List;
	import feathers.controls.SkinnableContainer;
	import feathers.controls.StateSkin;
	import feathers.controls.TextInput;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.app.zhuangbei.hecheng.button.ButtonHecheng;
	import org.mokylin.skin.component.button.ButtonSkin_jia;
	import org.mokylin.skin.component.button.ButtonSkin_jian;
	import org.mokylin.skin.component.button.ButtonSkin_putong;
	import org.mokylin.skin.component.button.ButtonSkin_shuoming;
	import org.mokylin.skin.component.list.ListSkin1;
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

		public var existall:feathers.controls.UIAsset;

		public var grp_cailiao:feathers.controls.Group;

		public var grp_exit:feathers.controls.Group;

		public var input_txt:feathers.controls.TextInput;

		public var lb_msg:feathers.controls.Label;

		public var list_Item:feathers.controls.List;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function HeCheng_Skin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 587;
			this.width = 947;
			this.elementsContent = [__HeCheng_Skin_UIAsset2_i(),__HeCheng_Skin_UIAsset3_i(),btn_shuoming_i(),__HeCheng_Skin_Group1_i(),grp_exit_i(),btns_i(),btnMax_i(),btn_hecheng_i(),lb_msg_i(),list_Item_i()];
			
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
			temp.x = 307;
			temp.y = 85;
			temp.elementsContent = [__HeCheng_Skin_Label1_i(),__HeCheng_Skin_Label2_i(),__HeCheng_Skin_Label3_i()];
			return temp;
		}

		private function __HeCheng_Skin_Label1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "合成原则：";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function __HeCheng_Skin_Label2_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "1获得低级材料可合成高级材料。";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 79;
			temp.y = 0;
			return temp;
		}

		private function __HeCheng_Skin_Label3_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "2绑定材料和非绑定材料合成后将获得绑定材料。";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 79;
			temp.y = 20;
			return temp;
		}

		private function __HeCheng_Skin_Label4_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.height = 24;
			temp.text = "合成数量：";
			temp.color = 0x8B8D7B;
			temp.width = 76;
			temp.x = 0;
			temp.y = 4;
			return temp;
		}

		private function __HeCheng_Skin_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 445;
			temp.styleName = "ui/common/background/neikuang_1.png";
			temp.width = 274;
			temp.x = 19;
			temp.y = 73;
			return temp;
		}

		private function __HeCheng_Skin_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/zhuangbei/hecheng/bg.jpg";
			temp.x = 293;
			temp.y = 75;
			return temp;
		}

		private function __HeCheng_Skin_UIAsset4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/zhuangbei/hecheng/xiaoguo.png";
			temp.x = 3;
			temp.y = 58;
			return temp;
		}

		private function __HeCheng_Skin_UIAsset5_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/zhuangbei/hecheng/xiaoguo.png";
			temp.x = 144;
			temp.y = 58;
			return temp;
		}

		private function __HeCheng_Skin_UIAsset6_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/zhuangbei/hecheng/xiaoguo.png";
			temp.x = 289;
			temp.y = 58;
			return temp;
		}

		private function btnMax_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnMax = temp;
			temp.name = "btnMax";
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.label = "Max";
			temp.leading = 0;
			temp.letterSpacing = 1;
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_putong;
			temp.color = 0xE1D4A9;
			temp.width = 79;
			temp.x = 659;
			temp.y = 420;
			return temp;
		}

		private function btn_hecheng_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_hecheng = temp;
			temp.name = "btn_hecheng";
			temp.styleClass = org.mokylin.skin.app.zhuangbei.hecheng.button.ButtonHecheng;
			temp.x = 544;
			temp.y = 459;
			return temp;
		}

		private function btn_max_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_max = temp;
			temp.name = "btn_max";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_jia;
			temp.x = 155;
			temp.y = 3;
			return temp;
		}

		private function btn_min_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_min = temp;
			temp.name = "btn_min";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_jian;
			temp.x = 74;
			temp.y = 3;
			return temp;
		}

		private function btn_shuoming_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_shuoming = temp;
			temp.name = "btn_shuoming";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_shuoming;
			temp.x = 834;
			temp.y = 83;
			return temp;
		}

		private function btns_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			btns = temp;
			temp.name = "btns";
			temp.width = 182;
			temp.x = 471;
			temp.y = 424;
			temp.elementsContent = [__HeCheng_Skin_Label4_i(),input_txt_i(),btn_min_i(),btn_max_i()];
			return temp;
		}

		private function cailiao1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			cailiao1 = temp;
			temp.name = "cailiao1";
			temp.styleName = "ui/app/zhuangbei/xiaodaojukuang.png";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function cailiao2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			cailiao2 = temp;
			temp.name = "cailiao2";
			temp.styleName = "ui/app/zhuangbei/xiaodaojukuang.png";
			temp.x = 141;
			temp.y = 0;
			return temp;
		}

		private function cailiao3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			cailiao3 = temp;
			temp.name = "cailiao3";
			temp.styleName = "ui/app/zhuangbei/xiaodaojukuang.png";
			temp.x = 289;
			temp.y = 0;
			return temp;
		}

		private function exist1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			exist1 = temp;
			temp.name = "exist1";
			temp.styleName = "ui/app/zhuangbei/hecheng/fangruxiaoguo.png";
			temp.visible = false;
			temp.x = 24;
			temp.y = 31;
			return temp;
		}

		private function exist2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			exist2 = temp;
			temp.name = "exist2";
			temp.styleName = "ui/app/zhuangbei/hecheng/fangruxiaoguo.png";
			temp.visible = false;
			temp.x = 166;
			temp.y = 31;
			return temp;
		}

		private function exist3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			exist3 = temp;
			temp.name = "exist3";
			temp.styleName = "ui/app/zhuangbei/hecheng/fangruxiaoguo.png";
			temp.visible = false;
			temp.x = 312;
			temp.y = 31;
			return temp;
		}

		private function existall_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			existall = temp;
			temp.name = "existall";
			temp.styleName = "ui/app/zhuangbei/hecheng/xuetiao.png";
			temp.x = 27;
			temp.y = 0;
			return temp;
		}

		private function grp_cailiao_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			grp_cailiao = temp;
			temp.name = "grp_cailiao";
			temp.x = 0;
			temp.y = 59;
			temp.elementsContent = [cailiao1_i(),cailiao2_i(),cailiao3_i()];
			return temp;
		}

		private function grp_exit_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			grp_exit = temp;
			temp.name = "grp_exit";
			temp.x = 437;
			temp.y = 265;
			temp.elementsContent = [grp_cailiao_i(),__HeCheng_Skin_UIAsset4_i(),__HeCheng_Skin_UIAsset5_i(),__HeCheng_Skin_UIAsset6_i(),exist1_i(),exist2_i(),exist3_i(),existall_i()];
			return temp;
		}

		private function input_txt_i():feathers.controls.TextInput
		{
			var temp:feathers.controls.TextInput = new feathers.controls.TextInput();
			input_txt = temp;
			temp.name = "input_txt";
			temp.styleClass = org.mokylin.skin.component.text.textInput3_Skin;
			temp.textAlign = "center";
			temp.color = 0x5CB006;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 72;
			temp.x = 89;
			temp.y = 1;
			return temp;
		}

		private function lb_msg_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lb_msg = temp;
			temp.name = "lb_msg";
			temp.height = 16;
			temp.textAlign = "center";
			temp.color = 0x8B8D7B;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 204;
			temp.x = 500;
			temp.y = 496;
			return temp;
		}

		private function list_Item_i():feathers.controls.List
		{
			var temp:feathers.controls.List = new feathers.controls.List();
			list_Item = temp;
			temp.name = "list_Item";
			temp.height = 438;
			temp.styleClass = org.mokylin.skin.component.list.ListSkin1;
			temp.width = 265;
			temp.x = 23;
			temp.y = 76;
			return temp;
		}

	}
}