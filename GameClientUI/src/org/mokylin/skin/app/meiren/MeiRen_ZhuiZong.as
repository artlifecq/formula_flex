package org.mokylin.skin.app.meiren
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Button;
	import feathers.controls.Group;
	import feathers.controls.Label;
	import feathers.controls.SkinnableContainer;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.app.meiren.MeiRenBoss_Item;
	import org.mokylin.skin.app.meiren.button.ButtonLijintisheng;
	import org.mokylin.skin.app.meiren.button.ButtonYuanbaotisheng;
	import org.mokylin.skin.component.button.ButtonSkin_hide;
	import org.mokylin.skin.component.button.ButtonSkin_putong2;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class MeiRen_ZhuiZong extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var btnLijin:feathers.controls.Button;

		public var btnYuanbao:feathers.controls.Button;

		public var btn_close:feathers.controls.Button;

		public var btn_open:feathers.controls.Button;

		public var head_left:feathers.controls.UIAsset;

		public var head_right:feathers.controls.UIAsset;

		public var killbut_0:feathers.controls.SkinnableContainer;

		public var killbut_1:feathers.controls.SkinnableContainer;

		public var lbHeadName:feathers.controls.Label;

		public var sec_fangyu:feathers.controls.Label;

		public var sec_info:feathers.controls.Label;

		public var sec_navi1:feathers.controls.Label;

		public var sec_navi2:feathers.controls.Label;

		public var sec_shanghai:feathers.controls.Label;

		public var sec_subbut2:feathers.controls.Button;

		public var sec_tishi:feathers.controls.Label;

		public var task_box:feathers.controls.Group;

		public var uiXiangxi:feathers.controls.UIAsset;

		public var ui_bg:feathers.controls.UIAsset;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function MeiRen_ZhuiZong()
		{
			super();
			
			this.currentState = "normal";
			this.height = 287;
			this.width = 248;
			this.elementsContent = [task_box_i(),btn_open_i(),btn_close_i(),btnYuanbao_i(),btnLijin_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __MeiRen_ZhuiZong_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/mainui/renwu/renwuzhuizongbg.png";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function btnLijin_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnLijin = temp;
			temp.name = "btnLijin";
			temp.styleClass = org.mokylin.skin.app.meiren.button.ButtonLijintisheng;
			temp.x = 175;
			temp.y = -61;
			return temp;
		}

		private function btnYuanbao_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnYuanbao = temp;
			temp.name = "btnYuanbao";
			temp.styleClass = org.mokylin.skin.app.meiren.button.ButtonYuanbaotisheng;
			temp.x = 104;
			temp.y = -61;
			return temp;
		}

		private function btn_close_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_close = temp;
			temp.name = "btn_close";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_hide;
			temp.x = 221;
			temp.y = 8;
			return temp;
		}

		private function btn_open_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_open = temp;
			temp.name = "btn_open";
			temp.scaleX = -1;
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_hide;
			temp.x = 243;
			temp.y = 8;
			return temp;
		}

		private function head_left_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			head_left = temp;
			temp.name = "head_left";
			temp.height = 10;
			temp.styleName = "ui/mainui/fubenzhuizong/zs.png";
			temp.width = 45;
			temp.x = 40;
			temp.y = 15;
			return temp;
		}

		private function head_right_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			head_right = temp;
			temp.name = "head_right";
			temp.height = 10;
			temp.scaleX = -1;
			temp.styleName = "ui/mainui/fubenzhuizong/zs.png";
			temp.width = 45;
			temp.x = 213;
			temp.y = 15;
			return temp;
		}

		private function killbut_0_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			killbut_0 = temp;
			temp.name = "killbut_0";
			temp.height = 20;
			var skin:StateSkin = new org.mokylin.skin.app.meiren.MeiRenBoss_Item()
			temp.skin = skin
			temp.width = 169;
			temp.x = 27;
			temp.y = 63;
			return temp;
		}

		private function killbut_1_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			killbut_1 = temp;
			temp.name = "killbut_1";
			temp.height = 20;
			var skin:StateSkin = new org.mokylin.skin.app.meiren.MeiRenBoss_Item()
			temp.skin = skin
			temp.width = 169;
			temp.x = 27;
			temp.y = 85;
			return temp;
		}

		private function lbHeadName_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbHeadName = temp;
			temp.name = "lbHeadName";
			temp.fontSize = 16;
			temp.text = "美人营救";
			temp.textAlign = "center";
			temp.color = 0xFFF2B7;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlue"];
			temp.width = 205;
			temp.x = 27;
			temp.y = 8;
			return temp;
		}

		private function sec_fangyu_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			sec_fangyu = temp;
			temp.name = "sec_fangyu";
			temp.letterSpacing = -1;
			temp.fontSize = 14;
			temp.text = "防御提升 $";
			temp.textAlign = "left";
			temp.color = 0xEAEABC;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 221;
			temp.x = 27;
			temp.y = 156;
			return temp;
		}

		private function sec_info_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			sec_info = temp;
			temp.name = "sec_info";
			temp.letterSpacing = -1;
			temp.fontSize = 14;
			temp.text = "副本剩余时间：00：22：08";
			temp.textAlign = "center";
			temp.color = 0xFF0D0D;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 209;
			temp.x = 22;
			temp.y = 207;
			return temp;
		}

		private function sec_navi1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			sec_navi1 = temp;
			temp.name = "sec_navi1";
			temp.text = "【挑战目标】";
			temp.color = 0xFFEA00;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 10;
			temp.y = 40;
			return temp;
		}

		private function sec_navi2_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			sec_navi2 = temp;
			temp.name = "sec_navi2";
			temp.text = "【提升效果】";
			temp.color = 0xFFEA00;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 10;
			temp.y = 110;
			return temp;
		}

		private function sec_shanghai_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			sec_shanghai = temp;
			temp.name = "sec_shanghai";
			temp.letterSpacing = -1;
			temp.fontSize = 14;
			temp.text = "伤害加深 $";
			temp.textAlign = "left";
			temp.color = 0xEAEABC;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 221;
			temp.x = 27;
			temp.y = 135;
			return temp;
		}

		private function sec_subbut2_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			sec_subbut2 = temp;
			temp.name = "sec_subbut2";
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.height = 36;
			temp.label = "退出副本";
			temp.fontSize = 16;
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_putong2;
			temp.color = 0xEAEABC;
			temp.width = 88;
			temp.x = 83;
			temp.y = 238;
			return temp;
		}

		private function sec_tishi_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			sec_tishi = temp;
			temp.name = "sec_tishi";
			temp.letterSpacing = -1;
			temp.fontSize = 14;
			temp.text = "提示：善用提升可提高自身战力";
			temp.textAlign = "center";
			temp.color = 0xFF0D0D;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 209;
			temp.x = 22;
			temp.y = 187;
			return temp;
		}

		private function task_box_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			task_box = temp;
			temp.name = "task_box";
			temp.width = 248;
			temp.x = 0;
			temp.y = 0;
			temp.elementsContent = [ui_bg_i(),__MeiRen_ZhuiZong_UIAsset1_i(),lbHeadName_i(),head_left_i(),head_right_i(),uiXiangxi_i(),killbut_0_i(),killbut_1_i(),sec_subbut2_i(),sec_info_i(),sec_tishi_i(),sec_shanghai_i(),sec_fangyu_i(),sec_navi1_i(),sec_navi2_i()];
			return temp;
		}

		private function uiXiangxi_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiXiangxi = temp;
			temp.name = "uiXiangxi";
			temp.styleName = "ui/mainui/fubenzhuizong/fuben/wenhao.png";
			temp.x = 9;
			temp.y = 9;
			return temp;
		}

		private function ui_bg_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			ui_bg = temp;
			temp.name = "ui_bg";
			temp.height = 287;
			temp.styleName = "ui/mainui/renwu/bg.png";
			temp.width = 248;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

	}
}