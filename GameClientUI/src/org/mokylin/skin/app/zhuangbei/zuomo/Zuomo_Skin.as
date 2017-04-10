package org.mokylin.skin.app.zhuangbei.zuomo
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Button;
	import feathers.controls.ComboBox;
	import feathers.controls.Group;
	import feathers.controls.Label;
	import feathers.controls.ProgressBar;
	import feathers.controls.SkinnableContainer;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.app.zhuangbei.Zhuangbei_left;
	import org.mokylin.skin.app.zhuangbei.zuomo.button.ButtonZhuomo;
	import org.mokylin.skin.component.button.ButtonSkin_putong2;
	import org.mokylin.skin.component.button.ButtonSkin_shuoming;
	import org.mokylin.skin.component.combobox.ComboBox1_Skin;
	import org.mokylin.skin.component.combobox.ComboBox2_Skin;
	import org.mokylin.skin.component.progress.pro_jindu_Skin;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class Zuomo_Skin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var arrow_up:feathers.controls.UIAsset;

		public var arrow_up2:feathers.controls.UIAsset;

		public var btn_qianghua_all:feathers.controls.Button;

		public var btn_shuoming:feathers.controls.Button;

		public var btn_zuomo:feathers.controls.Button;

		public var cmb_dengjie:feathers.controls.ComboBox;

		public var cmb_pinzhi:feathers.controls.ComboBox;

		public var grp_jiacheng:feathers.controls.Group;

		public var lb_current:feathers.controls.Label;

		public var lb_name:feathers.controls.Label;

		public var lb_next:feathers.controls.Label;

		public var lb_progress:feathers.controls.Label;

		public var lb_up1:feathers.controls.Label;

		public var lb_up2:feathers.controls.Label;

		public var left:feathers.controls.SkinnableContainer;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function Zuomo_Skin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 587;
			this.width = 947;
			this.elementsContent = [left_i(),__Zuomo_Skin_UIAsset3_i(),btn_shuoming_i(),lb_name_i(),btn_zuomo_i(),grp_jiacheng_i(),cmb_pinzhi_i(),cmb_dengjie_i(),btn_qianghua_all_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __Zuomo_Skin_Label1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "（当前等级）";
			temp.color = 0x8B8D7B;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 39;
			temp.y = 44;
			return temp;
		}

		private function __Zuomo_Skin_Label2_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "（琢磨后等级）";
			temp.color = 0x8B8D7B;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 382;
			temp.y = 44;
			return temp;
		}

		private function __Zuomo_Skin_Label3_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "装备基础属性提升：";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 145;
			temp.y = 49;
			return temp;
		}

		private function __Zuomo_Skin_Label4_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "0%";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 270;
			temp.y = 49;
			return temp;
		}

		private function __Zuomo_Skin_ProgressBar1_i():feathers.controls.ProgressBar
		{
			var temp:feathers.controls.ProgressBar = new feathers.controls.ProgressBar();
			temp.styleClass = org.mokylin.skin.component.progress.pro_jindu_Skin;
			temp.x = 118;
			temp.y = 14;
			return temp;
		}

		private function __Zuomo_Skin_UIAsset10_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/zhuangbei/qianghua/qianghuajiacheng.png";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function __Zuomo_Skin_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/zhuangbei/zuomo/bg.jpg";
			temp.x = 371;
			temp.y = 75;
			return temp;
		}

		private function arrow_up2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			arrow_up2 = temp;
			temp.name = "arrow_up2";
			temp.styleName = "ui/common/tubiao/tu_up.png";
			temp.x = 296;
			temp.y = 51;
			return temp;
		}

		private function arrow_up_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			arrow_up = temp;
			temp.name = "arrow_up";
			temp.styleName = "ui/common/tubiao/tu_up.png";
			temp.x = 448;
			temp.y = 25;
			return temp;
		}

		private function btn_qianghua_all_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_qianghua_all = temp;
			temp.name = "btn_qianghua_all";
			temp.styleClass = org.mokylin.skin.app.zhuangbei.zuomo.button.ButtonZhuomo;
			temp.x = 598;
			temp.y = 476;
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

		private function btn_zuomo_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_zuomo = temp;
			temp.name = "btn_zuomo";
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.label = "琢 磨";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_putong2;
			temp.color = 0xE1D4A9;
			temp.width = 77;
			temp.x = 612;
			temp.y = 264;
			return temp;
		}

		private function cmb_dengjie_i():feathers.controls.ComboBox
		{
			var temp:feathers.controls.ComboBox = new feathers.controls.ComboBox();
			cmb_dengjie = temp;
			temp.name = "cmb_dengjie";
			temp.height = 24;
			temp.fontSize = 14;
			temp.styleClass = org.mokylin.skin.component.combobox.ComboBox2_Skin;
			temp.textAlign = "left";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 70;
			temp.x = 529;
			temp.y = 445;
			return temp;
		}

		private function cmb_pinzhi_i():feathers.controls.ComboBox
		{
			var temp:feathers.controls.ComboBox = new feathers.controls.ComboBox();
			cmb_pinzhi = temp;
			temp.name = "cmb_pinzhi";
			temp.height = 24;
			temp.fontSize = 14;
			temp.styleClass = org.mokylin.skin.component.combobox.ComboBox1_Skin;
			temp.textAlign = "left";
			temp.color = 0x5CB006;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 171;
			temp.x = 599;
			temp.y = 445;
			return temp;
		}

		private function grp_jiacheng_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			grp_jiacheng = temp;
			temp.name = "grp_jiacheng";
			temp.x = 401;
			temp.y = 344;
			temp.elementsContent = [__Zuomo_Skin_UIAsset10_i(),lb_current_i(),lb_next_i(),__Zuomo_Skin_ProgressBar1_i(),lb_progress_i(),__Zuomo_Skin_Label1_i(),__Zuomo_Skin_Label2_i(),lb_up1_i(),arrow_up_i(),__Zuomo_Skin_Label3_i(),__Zuomo_Skin_Label4_i(),lb_up2_i(),arrow_up2_i()];
			return temp;
		}

		private function lb_current_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lb_current = temp;
			temp.name = "lb_current";
			temp.bold = true;
			temp.text = "等级1";
			temp.color = 0xE8C958;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 48;
			temp.x = 62;
			temp.y = 22;
			return temp;
		}

		private function lb_name_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lb_name = temp;
			temp.name = "lb_name";
			temp.text = "装备名字";
			temp.textAlign = "center";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 123;
			temp.x = 584;
			temp.y = 144;
			return temp;
		}

		private function lb_next_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lb_next = temp;
			temp.name = "lb_next";
			temp.bold = true;
			temp.text = "等级2";
			temp.color = 0xE8C958;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 48;
			temp.x = 395;
			temp.y = 22;
			return temp;
		}

		private function lb_progress_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lb_progress = temp;
			temp.name = "lb_progress";
			temp.text = "333/333";
			temp.textAlign = "center";
			temp.color = 0xDFB01F;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 139;
			temp.x = 184;
			temp.y = 24;
			return temp;
		}

		private function lb_up1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lb_up1 = temp;
			temp.name = "lb_up1";
			temp.text = "20";
			temp.color = 0x5CB006;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 457;
			temp.y = 23;
			return temp;
		}

		private function lb_up2_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lb_up2 = temp;
			temp.name = "lb_up2";
			temp.text = "1%";
			temp.color = 0x5CB006;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 305;
			temp.y = 49;
			return temp;
		}

		private function left_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			left = temp;
			temp.name = "left";
			temp.height = 431;
			var skin:StateSkin = new org.mokylin.skin.app.zhuangbei.Zhuangbei_left()
			temp.skin = skin
			temp.width = 340;
			temp.x = 23;
			temp.y = 79;
			return temp;
		}

	}
}