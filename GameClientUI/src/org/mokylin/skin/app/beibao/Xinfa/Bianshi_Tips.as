package org.mokylin.skin.app.beibao.Xinfa
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Button;
	import feathers.controls.Label;
	import feathers.controls.SkinnableContainer;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.common.TongYongTanKuang_bg2;
	import org.mokylin.skin.component.button.ButtonSkin_close;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class Bianshi_Tips extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var bg:feathers.controls.SkinnableContainer;

		public var btnClose:feathers.controls.Button;

		public var lbBoss:feathers.controls.Label;

		public var lbCailiao:feathers.controls.Label;

		public var lbFuben:feathers.controls.Label;

		public var lbJixian:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function Bianshi_Tips()
		{
			super();
			
			this.currentState = "normal";
			this.height = 217;
			this.width = 331;
			this.elementsContent = [bg_i(),__Bianshi_Tips_UIAsset1_i(),btnClose_i(),__Bianshi_Tips_Label1_i(),lbFuben_i(),lbJixian_i(),lbBoss_i(),__Bianshi_Tips_UIAsset2_i(),__Bianshi_Tips_UIAsset3_i(),lbCailiao_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __Bianshi_Tips_Label1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "砭石获得途径：";
			temp.color = 0xEAEABC;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 30;
			temp.y = 83;
			return temp;
		}

		private function __Bianshi_Tips_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 169;
			temp.styleName = "ui/common/background/neikuang_1.png";
			temp.width = 316;
			temp.x = 7;
			temp.y = 35;
			return temp;
		}

		private function __Bianshi_Tips_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.touchable = false;
			temp.touchGroup = true;
			temp.styleName = "ui/common/background/bianshiliebiao.png";
			temp.x = 119;
			temp.y = 7;
			return temp;
		}

		private function __Bianshi_Tips_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/beibao/xinfa/pomo2.png";
			temp.x = 83;
			temp.y = 44;
			return temp;
		}

		private function bg_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			bg = temp;
			temp.name = "bg";
			temp.height = 217;
			var skin:StateSkin = new org.mokylin.skin.common.TongYongTanKuang_bg2()
			temp.skin = skin
			temp.width = 331;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function btnClose_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnClose = temp;
			temp.name = "btnClose";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_close;
			temp.x = 297;
			temp.y = 7;
			return temp;
		}

		private function lbBoss_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbBoss = temp;
			temp.name = "lbBoss";
			temp.text = "3、世界BOSS掉落";
			temp.color = 0x00FF33;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.underline = true;
			temp.x = 47;
			temp.y = 157;
			return temp;
		}

		private function lbCailiao_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbCailiao = temp;
			temp.name = "lbCailiao";
			temp.htmlText = "需要<font color='#ff0d0d'>攻击砭石</font>";
			temp.textAlign = "center";
			temp.color = 0xEAEABC;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 140;
			temp.x = 97;
			temp.y = 50;
			return temp;
		}

		private function lbFuben_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbFuben = temp;
			temp.name = "lbFuben";
			temp.text = "1、多人副本";
			temp.color = 0x00FF33;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.underline = true;
			temp.x = 47;
			temp.y = 107;
			return temp;
		}

		private function lbJixian_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbJixian = temp;
			temp.name = "lbJixian";
			temp.text = "2、装备副本";
			temp.color = 0x00FF33;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.underline = true;
			temp.x = 47;
			temp.y = 132;
			return temp;
		}

	}
}