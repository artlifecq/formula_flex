package org.mokylin.skin.app.banghui
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Button;
	import feathers.controls.Label;
	import feathers.controls.SkinnableContainer;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import feathers.controls.UINumber;
	import org.mokylin.skin.app.banghui.ItemBg;
	import org.mokylin.skin.component.button.ButtonSkin_putong;
	import org.mokylin.skin.component.uinumber.UINumberSkin_zhandouli_yellow2;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class TeamItem1_Skin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var btnAdd:feathers.controls.Button;

		public var lbFull:feathers.controls.Label;

		public var lbLevel:feathers.controls.Label;

		public var lbNum:feathers.controls.Label;

		public var lbRolenName:feathers.controls.Label;

		public var lbTeamName:feathers.controls.Label;

		public var lbZhanli:feathers.controls.Label;

		public var numList:feathers.controls.UINumber;

		public var numList2:feathers.controls.Label;

		public var uiFirt:feathers.controls.UIAsset;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function TeamItem1_Skin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 36;
			this.width = 627;
			this.elementsContent = [__TeamItem1_Skin_SkinnableContainer1_i(),uiFirt_i(),numList_i(),numList2_i(),lbTeamName_i(),lbLevel_i(),lbRolenName_i(),lbNum_i(),lbZhanli_i(),btnAdd_i(),lbFull_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __TeamItem1_Skin_SkinnableContainer1_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			temp.height = 36;
			var skin:StateSkin = new org.mokylin.skin.app.banghui.ItemBg()
			temp.skin = skin
			temp.width = 627;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function btnAdd_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnAdd = temp;
			temp.name = "btnAdd";
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.label = "申请加入";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_putong;
			temp.color = 0xCFC6AE;
			temp.width = 79;
			temp.x = 537;
			temp.y = 0;
			return temp;
		}

		private function lbFull_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbFull = temp;
			temp.name = "lbFull";
			temp.text = "已满员";
			temp.color = 0xFF0000;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 552;
			temp.y = 10;
			return temp;
		}

		private function lbLevel_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbLevel = temp;
			temp.name = "lbLevel";
			temp.text = "99";
			temp.textAlign = "center";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 27;
			temp.x = 209;
			temp.y = 10;
			return temp;
		}

		private function lbNum_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbNum = temp;
			temp.name = "lbNum";
			temp.text = "999/999";
			temp.textAlign = "center";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 64;
			temp.x = 371;
			temp.y = 10;
			return temp;
		}

		private function lbRolenName_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbRolenName = temp;
			temp.name = "lbRolenName";
			temp.text = "玩家名字六字";
			temp.color = 0x6BCC08;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 95;
			temp.x = 260;
			temp.y = 10;
			return temp;
		}

		private function lbTeamName_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbTeamName = temp;
			temp.name = "lbTeamName";
			temp.text = "帮派名字七个字";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.underline = true;
			temp.width = 106;
			temp.x = 76;
			temp.y = 10;
			return temp;
		}

		private function lbZhanli_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbZhanli = temp;
			temp.name = "lbZhanli";
			temp.text = "999999999";
			temp.textAlign = "left";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 88;
			temp.x = 453;
			temp.y = 10;
			return temp;
		}

		private function numList2_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			numList2 = temp;
			temp.name = "numList2";
			temp.text = "4";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 36;
			temp.y = 11;
			return temp;
		}

		private function numList_i():feathers.controls.UINumber
		{
			var temp:feathers.controls.UINumber = new feathers.controls.UINumber();
			numList = temp;
			temp.name = "numList";
			temp.gap = 0;
			temp.height = 25;
			temp.label = "1";
			temp.styleClass = org.mokylin.skin.component.uinumber.UINumberSkin_zhandouli_yellow2;
			temp.width = 33;
			temp.x = 31;
			temp.y = 2;
			return temp;
		}

		private function uiFirt_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiFirt = temp;
			temp.name = "uiFirt";
			temp.styleName = "ui/app/banghui/huawen.png";
			temp.x = 0;
			temp.y = 14;
			return temp;
		}

	}
}