package org.mokylin.skin.app.zhanchang
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Label;
	import feathers.controls.SkinnableContainer;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import feathers.controls.UINumber;
	import org.mokylin.skin.component.uinumber.UINumberSkin_zhujuezhandouli;
	import org.mokylin.skin.mainui.head.npc_xuecao1;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class Head__Role_Right extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var UI_bingjia:feathers.controls.UIAsset;

		public var UI_mojia:feathers.controls.UIAsset;

		public var UI_yijia:feathers.controls.UIAsset;

		public var lbName:feathers.controls.Label;

		public var numZhandouli:feathers.controls.UINumber;

		public var role_xuecao:feathers.controls.SkinnableContainer;

		public var zhan_bg:feathers.controls.UIAsset;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function Head__Role_Right()
		{
			super();
			
			this.currentState = "normal";
			this.height = 91;
			this.width = 310;
			this.elementsContent = [__Head__Role_Right_UIAsset1_i(),role_xuecao_i(),__Head__Role_Right_UIAsset2_i(),lbName_i(),zhan_bg_i(),numZhandouli_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __Head__Role_Right_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.touchable = false;
			temp.touchGroup = true;
			temp.scaleX = -1;
			temp.styleName = "ui/mainui/head/npcxuechao.png";
			temp.x = 247;
			temp.y = 10;
			return temp;
		}

		private function __Head__Role_Right_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.touchable = false;
			temp.touchGroup = true;
			temp.scaleX = -1;
			temp.styleName = "ui/mainui/head/npctouxiangkuang.png";
			temp.x = 310;
			temp.y = 9;
			return temp;
		}

		private function lbName_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbName = temp;
			temp.name = "lbName";
			temp.bold = false;
			temp.text = "角色名六个字 (120级)";
			temp.color = 0xC3C198;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack2"];
			temp.x = 92;
			temp.y = 10;
			return temp;
		}

		private function numZhandouli_i():feathers.controls.UINumber
		{
			var temp:feathers.controls.UINumber = new feathers.controls.UINumber();
			numZhandouli = temp;
			temp.name = "numZhandouli";
			temp.gap = -3;
			temp.height = 25;
			temp.label = "6521478";
			temp.styleClass = org.mokylin.skin.component.uinumber.UINumberSkin_zhujuezhandouli;
			temp.width = 109;
			temp.x = 108;
			temp.y = 60;
			return temp;
		}

		private function role_xuecao_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			role_xuecao = temp;
			temp.name = "role_xuecao";
			temp.height = 12;
			temp.scaleX = 1;
			var skin:StateSkin = new org.mokylin.skin.mainui.head.npc_xuecao1()
			temp.skin = skin
			temp.width = 200;
			temp.x = 21;
			temp.y = 33;
			return temp;
		}

		private function zhan_bg_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			zhan_bg = temp;
			temp.name = "zhan_bg";
			temp.styleName = "ui/mainui/head/zhandi.png";
			temp.x = 71;
			temp.y = 43;
			return temp;
		}

	}
}