package org.mokylin.skin.mainui.head
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Group;
	import feathers.controls.Label;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import feathers.controls.UINumber;
	import feathers.layout.HorizontalLayout;
	import org.mokylin.skin.component.uinumber.UINumberSkin_bossxuetiao;
	import org.mokylin.skin.component.uinumber.UINumberSkin_zhujuezhandouli;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class Head_boss extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var grp_xueyiao:feathers.controls.Group;

		public var lbl_name:feathers.controls.Label;

		public var lbl_num:feathers.controls.Label;

		public var uim_xuetiao:feathers.controls.UINumber;

		public var uim_zhandouli:feathers.controls.UINumber;

		public var xuetiao_cheng:feathers.controls.UIAsset;

		public var xuetiao_hong:feathers.controls.UIAsset;

		public var xuetiao_lan:feathers.controls.UIAsset;

		public var xuetiao_lv:feathers.controls.UIAsset;

		public var xuetiao_zi:feathers.controls.UIAsset;

		public var zhan_bg:feathers.controls.UIAsset;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function Head_boss()
		{
			super();
			
			this.currentState = "normal";
			this.height = 97;
			this.width = 506;
			this.elementsContent = [__Head_boss_UIAsset1_i(),grp_xueyiao_i(),lbl_name_i(),uim_xuetiao_i(),zhan_bg_i(),uim_zhandouli_i(),lbl_num_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __Head_boss_HorizontalLayout1_i():feathers.layout.HorizontalLayout
		{
			var temp:feathers.layout.HorizontalLayout = new feathers.layout.HorizontalLayout();
			temp.gap = 0;
			temp.verticalAlign = "middle";
			return temp;
		}

		private function __Head_boss_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/mainui/head/boss/bossxuetiao.png";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function grp_xueyiao_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			grp_xueyiao = temp;
			temp.name = "grp_xueyiao";
			temp.x = 80;
			temp.y = 30;
			temp.elementsContent = [xuetiao_zi_i(),xuetiao_lan_i(),xuetiao_lv_i(),xuetiao_cheng_i(),xuetiao_hong_i()];
			return temp;
		}

		private function lbl_name_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbl_name = temp;
			temp.name = "lbl_name";
			temp.height = 22;
			temp.letterSpacing = 0;
			temp.fontSize = 16;
			temp.text = "角色名六个字 (120级)";
			temp.textAlign = "center";
			temp.color = 0xC3C198;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack2"];
			temp.width = 213;
			temp.x = 157;
			temp.y = 0;
			return temp;
		}

		private function lbl_num_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbl_num = temp;
			temp.name = "lbl_num";
			temp.text = "标签";
			temp.textAlign = "center";
			temp.color = 0xE1D4A9;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 363;
			temp.x = 78;
			temp.y = 29;
			return temp;
		}

		private function uim_xuetiao_i():feathers.controls.UINumber
		{
			var temp:feathers.controls.UINumber = new feathers.controls.UINumber();
			uim_xuetiao = temp;
			temp.name = "uim_xuetiao";
			temp.gap = 0;
			temp.height = 25;
			temp.label = "x5";
			temp.styleClass = org.mokylin.skin.component.uinumber.UINumberSkin_bossxuetiao;
			temp.width = 46;
			temp.x = 427;
			temp.y = 7;
			temp.layout = __Head_boss_HorizontalLayout1_i();
			return temp;
		}

		private function uim_zhandouli_i():feathers.controls.UINumber
		{
			var temp:feathers.controls.UINumber = new feathers.controls.UINumber();
			uim_zhandouli = temp;
			temp.name = "uim_zhandouli";
			temp.gap = -3;
			temp.height = 25;
			temp.label = "6521478";
			temp.styleClass = org.mokylin.skin.component.uinumber.UINumberSkin_zhujuezhandouli;
			temp.width = 109;
			temp.x = 397;
			temp.y = 65;
			return temp;
		}

		private function xuetiao_cheng_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			xuetiao_cheng = temp;
			temp.name = "xuetiao_cheng";
			temp.styleName = "ui/mainui/head/boss/xuetiaohuang.png";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function xuetiao_hong_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			xuetiao_hong = temp;
			temp.name = "xuetiao_hong";
			temp.styleName = "ui/mainui/head/boss/xuetiaohong.png";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function xuetiao_lan_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			xuetiao_lan = temp;
			temp.name = "xuetiao_lan";
			temp.styleName = "ui/mainui/head/boss/xuetiaolan.png";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function xuetiao_lv_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			xuetiao_lv = temp;
			temp.name = "xuetiao_lv";
			temp.styleName = "ui/mainui/head/boss/xuetiaolv.png";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function xuetiao_zi_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			xuetiao_zi = temp;
			temp.name = "xuetiao_zi";
			temp.styleName = "ui/mainui/head/boss/xuetiaozi.png";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function zhan_bg_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			zhan_bg = temp;
			temp.name = "zhan_bg";
			temp.styleName = "ui/mainui/head/zhandi.png";
			temp.x = 360;
			temp.y = 48;
			return temp;
		}

	}
}