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
		public var buff1:feathers.controls.UIAsset;

		public var buff2:feathers.controls.UIAsset;

		public var buff3:feathers.controls.UIAsset;

		public var grp_xueyiao:feathers.controls.Group;

		public var lbl_name:feathers.controls.Label;

		public var uim_xuetiao:feathers.controls.UINumber;

		public var uim_zhandouli:feathers.controls.UINumber;

		public var xuetiao_cheng:feathers.controls.UIAsset;

		public var xuetiao_hong:feathers.controls.UIAsset;

		public var xuetiao_lan:feathers.controls.UIAsset;

		public var xuetiao_lv:feathers.controls.UIAsset;

		public var xuetiao_zi:feathers.controls.UIAsset;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function Head_boss()
		{
			super();
			
			this.currentState = "normal";
			this.height = 92;
			this.width = 506;
			this.elementsContent = [__Head_boss_UIAsset1_i(),grp_xueyiao_i(),lbl_name_i(),uim_xuetiao_i(),__Head_boss_UIAsset2_i(),uim_zhandouli_i()];
			
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
			temp.styleName = "ui/mainui/head/boss/3_sanji.png";
			temp.x = 0;
			temp.y = 13;
			return temp;
		}

		private function __Head_boss_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/mainui/head/zhandi.png";
			temp.x = 360;
			temp.y = 43;
			return temp;
		}

		private function grp_xueyiao_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			grp_xueyiao = temp;
			temp.name = "grp_xueyiao";
			temp.x = 34;
			temp.y = 25;
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
			temp.x = 147;
			temp.y = 0;
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
			temp.y = 60;
			return temp;
		}

		private function xuetiao_cheng_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			xuetiao_cheng = temp;
			temp.name = "xuetiao_cheng";
			temp.styleName = "ui/mainui/head/boss/huangse.png";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function xuetiao_hong_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			xuetiao_hong = temp;
			temp.name = "xuetiao_hong";
			temp.styleName = "ui/mainui/head/boss/hongse.png";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function xuetiao_lan_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			xuetiao_lan = temp;
			temp.name = "xuetiao_lan";
			temp.styleName = "ui/mainui/head/boss/lanse.png";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function xuetiao_lv_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			xuetiao_lv = temp;
			temp.name = "xuetiao_lv";
			temp.styleName = "ui/mainui/head/boss/lvse.png";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function xuetiao_zi_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			xuetiao_zi = temp;
			temp.name = "xuetiao_zi";
			temp.styleName = "ui/mainui/head/boss/zise.png";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

	}
}