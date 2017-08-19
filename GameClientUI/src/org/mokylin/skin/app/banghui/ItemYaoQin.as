package org.mokylin.skin.app.banghui
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Button;
	import feathers.controls.Label;
	import feathers.controls.SkinnableContainer;
	import feathers.controls.StateSkin;
	import org.mokylin.skin.common.ItemBg;
	import org.mokylin.skin.component.button.ButtonSkin_putong3;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class ItemYaoQin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var bg:feathers.controls.SkinnableContainer;

		public var btnOk:feathers.controls.Button;

		public var lbLevel:feathers.controls.Label;

		public var lbNum:feathers.controls.Label;

		public var lbRoleName:feathers.controls.Label;

		public var lbTeamName:feathers.controls.Label;

		public var lbZhanli:feathers.controls.Label;

		public var lbZhanli0:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function ItemYaoQin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 33;
			this.width = 549;
			this.elementsContent = [bg_i(),lbTeamName_i(),lbLevel_i(),lbRoleName_i(),lbNum_i(),lbZhanli_i(),btnOk_i(),lbZhanli0_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function bg_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			bg = temp;
			temp.name = "bg";
			temp.height = 33;
			var skin:StateSkin = new org.mokylin.skin.common.ItemBg()
			temp.skin = skin
			temp.width = 549;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function btnOk_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnOk = temp;
			temp.name = "btnOk";
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.label = "加入";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_putong3;
			temp.color = 0xCFC6AE;
			temp.width = 68;
			temp.x = 473;
			temp.y = 6;
			return temp;
		}

		private function lbLevel_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbLevel = temp;
			temp.name = "lbLevel";
			temp.text = "99";
			temp.textAlign = "center";
			temp.color = 0xEAEABC;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 43;
			temp.x = 148;
			temp.y = 8;
			return temp;
		}

		private function lbNum_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbNum = temp;
			temp.name = "lbNum";
			temp.text = "999/999";
			temp.textAlign = "center";
			temp.color = 0xEAEABC;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 69;
			temp.x = 298;
			temp.y = 9;
			return temp;
		}

		private function lbRoleName_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbRoleName = temp;
			temp.name = "lbRoleName";
			temp.text = "玩家名字六子";
			temp.textAlign = "center";
			temp.color = 0x00FF0C;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 104;
			temp.x = 191;
			temp.y = 8;
			return temp;
		}

		private function lbTeamName_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbTeamName = temp;
			temp.name = "lbTeamName";
			temp.text = "[00000]帮派名字七个字";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.underline = true;
			temp.width = 160;
			temp.x = 2;
			temp.y = 8;
			return temp;
		}

		private function lbZhanli0_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbZhanli0 = temp;
			temp.name = "lbZhanli0";
			temp.text = "已满员";
			temp.textAlign = "center";
			temp.color = 0xE1201C;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 68;
			temp.x = 473;
			temp.y = 9;
			return temp;
		}

		private function lbZhanli_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbZhanli = temp;
			temp.name = "lbZhanli";
			temp.text = "999999999";
			temp.textAlign = "center";
			temp.color = 0xEAEABC;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 104;
			temp.x = 370;
			temp.y = 9;
			return temp;
		}

	}
}