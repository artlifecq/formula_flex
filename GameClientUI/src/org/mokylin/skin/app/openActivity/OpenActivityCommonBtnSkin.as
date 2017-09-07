package org.mokylin.skin.app.openActivity
{
	import feathers.controls.Group;
	import feathers.controls.Radio;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.app.openActivity.ButtonBasebtn;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class OpenActivityCommonBtnSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var btn:feathers.controls.Radio;

		public var flag:feathers.controls.UIAsset;

		public var flagbg:feathers.controls.UIAsset;

		public var gReward:feathers.controls.Group;

		public var icon:feathers.controls.UIAsset;

		public var uiText:feathers.controls.UIAsset;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function OpenActivityCommonBtnSkin()
		{
			super();
			
			this.currentState = "normal";
			this.elementsContent = [btn_i(),uiText_i(),icon_i(),gReward_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function btn_i():feathers.controls.Radio
		{
			var temp:feathers.controls.Radio = new feathers.controls.Radio();
			btn = temp;
			temp.name = "btn";
			temp.styleClass = org.mokylin.skin.app.openActivity.ButtonBasebtn;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function flag_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			flag = temp;
			temp.name = "flag";
			temp.styleName = "ui/common/lingqu.png";
			temp.x = 26;
			temp.y = 3;
			return temp;
		}

		private function flagbg_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			flagbg = temp;
			temp.name = "flagbg";
			temp.styleName = "ui/common/zhaohui_di.png";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function gReward_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			gReward = temp;
			temp.name = "gReward";
			temp.x = 139;
			temp.y = 3;
			temp.elementsContent = [flagbg_i(),flag_i()];
			return temp;
		}

		private function icon_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			icon = temp;
			temp.name = "icon";
			temp.height = 32;
			temp.width = 34;
			temp.x = 5;
			temp.y = 6;
			return temp;
		}

		private function uiText_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiText = temp;
			temp.name = "uiText";
			temp.height = 31;
			temp.touchable = false;
			temp.touchGroup = true;
			temp.width = 134;
			temp.x = 35;
			temp.y = 11;
			return temp;
		}

	}
}