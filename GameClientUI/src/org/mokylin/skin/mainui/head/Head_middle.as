package org.mokylin.skin.mainui.head
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Group;
	import feathers.controls.Label;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import feathers.controls.UINumber;
	import org.mokylin.skin.component.uinumber.UINumberSkin_zhujuezhandouli;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class Head_middle extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var grp_buff:feathers.controls.Group;

		public var lbl_name:feathers.controls.Label;

		public var uim_zhandouli:feathers.controls.UINumber;

		public var xuetiao_hong:feathers.controls.UIAsset;

		public var zhan_bg:feathers.controls.UIAsset;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function Head_middle()
		{
			super();
			
			this.currentState = "normal";
			this.height = 92;
			this.width = 409;
			this.elementsContent = [__Head_middle_UIAsset1_i(),xuetiao_hong_i(),lbl_name_i(),grp_buff_i(),zhan_bg_i(),uim_zhandouli_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __Head_middle_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/mainui/head/middle/2_erji.png";
			temp.x = 0;
			temp.y = 13;
			return temp;
		}

		private function grp_buff_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			grp_buff = temp;
			temp.name = "grp_buff";
			temp.x = 8;
			temp.y = 57;
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
			temp.width = 234;
			temp.x = 76;
			temp.y = 0;
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
			temp.x = 300;
			temp.y = 60;
			return temp;
		}

		private function xuetiao_hong_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			xuetiao_hong = temp;
			temp.name = "xuetiao_hong";
			temp.styleName = "ui/mainui/head/middle/hongse_2.png";
			temp.x = 13;
			temp.y = 26;
			return temp;
		}

		private function zhan_bg_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			zhan_bg = temp;
			temp.name = "zhan_bg";
			temp.styleName = "ui/mainui/head/zhandi.png";
			temp.x = 263;
			temp.y = 43;
			return temp;
		}

	}
}