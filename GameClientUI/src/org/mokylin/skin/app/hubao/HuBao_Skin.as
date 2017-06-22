package org.mokylin.skin.app.hubao
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Button;
	import feathers.controls.Check;
	import feathers.controls.Group;
	import feathers.controls.Label;
	import feathers.controls.SkinnableContainer;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.app.hubao.HuBaoItem2_Skin;
	import org.mokylin.skin.app.hubao.HuBaoItem_Skin;
	import org.mokylin.skin.app.hubao.button.ButtonHusong;
	import org.mokylin.skin.app.hubao.button.ButtonTisheng;
	import org.mokylin.skin.common.yiji_panelbg2_Skin;
	import org.mokylin.skin.component.check.CheckBoxSkin_1;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class HuBao_Skin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var bg:feathers.controls.SkinnableContainer;

		public var btnHuSong:feathers.controls.Button;

		public var btnTiSheng:feathers.controls.Button;

		public var chk_ok:feathers.controls.Check;

		public var grp1:feathers.controls.Group;

		public var grp2:feathers.controls.Group;

		public var grp3:feathers.controls.Group;

		public var grp4:feathers.controls.Group;

		public var jiangli_1:feathers.controls.SkinnableContainer;

		public var jiangli_2:feathers.controls.SkinnableContainer;

		public var jiangli_3:feathers.controls.SkinnableContainer;

		public var jiangli_4:feathers.controls.SkinnableContainer;

		public var lbCaiLiao:feathers.controls.Label;

		public var lbCiShu:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function HuBao_Skin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 587;
			this.width = 947;
			this.elementsContent = [bg_i(),__HuBao_Skin_UIAsset1_i(),__HuBao_Skin_UIAsset2_i(),__HuBao_Skin_UIAsset3_i(),__HuBao_Skin_UIAsset4_i(),grp1_i(),grp2_i(),grp3_i(),grp4_i(),jiangli_1_i(),jiangli_2_i(),jiangli_3_i(),jiangli_4_i(),__HuBao_Skin_Label1_i(),__HuBao_Skin_Label2_i(),__HuBao_Skin_Label3_i(),lbCaiLiao_i(),lbCiShu_i(),__HuBao_Skin_Label4_i(),chk_ok_i(),btnTiSheng_i(),btnHuSong_i(),__HuBao_Skin_UIAsset5_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __HuBao_Skin_Label1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "每日双倍奖励时间：";
			temp.color = 0xC2992B;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 32;
			temp.y = 490;
			return temp;
		}

		private function __HuBao_Skin_Label2_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "15:30-16:00";
			temp.color = 0x5CB006;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 33;
			temp.y = 508;
			return temp;
		}

		private function __HuBao_Skin_Label3_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "18:30-19:00";
			temp.color = 0x5CB006;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 33;
			temp.y = 522;
			return temp;
		}

		private function __HuBao_Skin_Label4_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "自动购买";
			temp.color = 0x5CB006;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 341;
			temp.y = 539;
			return temp;
		}

		private function __HuBao_Skin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 500;
			temp.styleName = "ui/common/background/neikuang_1.png";
			temp.width = 922;
			temp.x = 14;
			temp.y = 69;
			return temp;
		}

		private function __HuBao_Skin_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 93;
			temp.styleName = "ui/common/background/neikuang_1.png";
			temp.width = 913;
			temp.x = 19;
			temp.y = 471;
			return temp;
		}

		private function __HuBao_Skin_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/hubao/bg.jpg";
			temp.x = 21;
			temp.y = 74;
			return temp;
		}

		private function __HuBao_Skin_UIAsset4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/hubao/xinxibg.png";
			temp.x = 24;
			temp.y = 476;
			return temp;
		}

		private function __HuBao_Skin_UIAsset5_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.touchable = false;
			temp.touchGroup = true;
			temp.styleName = "ui/app/hubao/jianghuhubao_title.png";
			temp.x = 435;
			temp.y = 13;
			return temp;
		}

		private function bg_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			bg = temp;
			temp.name = "bg";
			temp.height = 587;
			var skin:StateSkin = new org.mokylin.skin.common.yiji_panelbg2_Skin()
			temp.skin = skin
			temp.width = 947;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function btnHuSong_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnHuSong = temp;
			temp.name = "btnHuSong";
			temp.styleClass = org.mokylin.skin.app.hubao.button.ButtonHusong;
			temp.x = 521;
			temp.y = 484;
			return temp;
		}

		private function btnTiSheng_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnTiSheng = temp;
			temp.name = "btnTiSheng";
			temp.styleClass = org.mokylin.skin.app.hubao.button.ButtonTisheng;
			temp.x = 320;
			temp.y = 484;
			return temp;
		}

		private function chk_ok_i():feathers.controls.Check
		{
			var temp:feathers.controls.Check = new feathers.controls.Check();
			chk_ok = temp;
			temp.name = "chk_ok";
			temp.styleClass = org.mokylin.skin.component.check.CheckBoxSkin_1;
			temp.x = 317;
			temp.y = 536;
			return temp;
		}

		private function grp1_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			grp1 = temp;
			temp.name = "grp1";
			temp.height = 386;
			temp.width = 190;
			temp.x = 51;
			temp.y = 77;
			return temp;
		}

		private function grp2_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			grp2 = temp;
			temp.name = "grp2";
			temp.height = 386;
			temp.width = 190;
			temp.x = 273;
			temp.y = 77;
			return temp;
		}

		private function grp3_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			grp3 = temp;
			temp.name = "grp3";
			temp.height = 386;
			temp.width = 190;
			temp.x = 491;
			temp.y = 77;
			return temp;
		}

		private function grp4_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			grp4 = temp;
			temp.name = "grp4";
			temp.height = 386;
			temp.width = 190;
			temp.x = 710;
			temp.y = 77;
			return temp;
		}

		private function jiangli_1_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			jiangli_1 = temp;
			temp.name = "jiangli_1";
			temp.height = 72;
			var skin:StateSkin = new org.mokylin.skin.app.hubao.HuBaoItem_Skin()
			temp.skin = skin
			temp.width = 139;
			temp.x = 77;
			temp.y = 398;
			return temp;
		}

		private function jiangli_2_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			jiangli_2 = temp;
			temp.name = "jiangli_2";
			temp.height = 72;
			var skin:StateSkin = new org.mokylin.skin.app.hubao.HuBaoItem_Skin()
			temp.skin = skin
			temp.width = 139;
			temp.x = 296;
			temp.y = 398;
			return temp;
		}

		private function jiangli_3_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			jiangli_3 = temp;
			temp.name = "jiangli_3";
			temp.height = 72;
			var skin:StateSkin = new org.mokylin.skin.app.hubao.HuBaoItem_Skin()
			temp.skin = skin
			temp.width = 139;
			temp.x = 516;
			temp.y = 398;
			return temp;
		}

		private function jiangli_4_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			jiangli_4 = temp;
			temp.name = "jiangli_4";
			temp.height = 72;
			var skin:StateSkin = new org.mokylin.skin.app.hubao.HuBaoItem2_Skin()
			temp.skin = skin
			temp.width = 139;
			temp.x = 735;
			temp.y = 398;
			return temp;
		}

		private function lbCaiLiao_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbCaiLiao = temp;
			temp.name = "lbCaiLiao";
			temp.htmlText = "消耗：<font color='#9d4aa8'>护宝旗*2</font><font color='#5DBD37'>(3)</font>";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 134;
			temp.x = 316;
			temp.y = 517;
			return temp;
		}

		private function lbCiShu_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbCiShu = temp;
			temp.name = "lbCiShu";
			temp.htmlText = "剩余次数:<font color='#5DBD37'>3/3次</font>";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 134;
			temp.x = 521;
			temp.y = 525;
			return temp;
		}

	}
}