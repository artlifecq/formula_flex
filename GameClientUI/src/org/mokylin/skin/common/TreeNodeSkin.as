package org.mokylin.skin.common
{
	import feathers.themes.GuiThemeStyle;
	import feathers.controls.Group;
	import feathers.controls.Label;
	import feathers.controls.StateSkin;
	import feathers.controls.ToggleButton;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.component.button.ButtonSkin_jiajian;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class TreeNodeSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var bg:feathers.controls.UIAsset;

		public var btn:feathers.controls.ToggleButton;

		public var icon:feathers.controls.UIAsset;

		public var lb:feathers.controls.Label;

		public var topBar:feathers.controls.Group;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function TreeNodeSkin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 26;
			this.width = 280;
			this.elementsContent = [bg_i(),topBar_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function bg_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			bg = temp;
			temp.name = "bg";
			temp.height = 26;
			temp.styleName = "ui/common/kang/liebiao_dikuang/biaoti_dikuang.png";
			temp.width = 280;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function btn_i():feathers.controls.ToggleButton
		{
			var temp:feathers.controls.ToggleButton = new feathers.controls.ToggleButton();
			btn = temp;
			temp.name = "btn";
			temp.height = 29;
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.button.ButtonSkin_jiajian);
			temp.width = 30;
			temp.x = 0;
			temp.y = 1;
			return temp;
		}

		private function icon_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			icon = temp;
			temp.name = "icon";
			temp.styleName = "ui/common/icon/ys/ysh.png";
			temp.x = 35;
			temp.y = 0;
			return temp;
		}

		private function lb_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lb = temp;
			temp.name = "lb";
			temp.bold = true;
			temp.height = 21;
			temp.letterSpacing = 2;
			temp.fontSize = 14;
			temp.text = "标签";
			temp.color = 0xF2EEEE;
			temp.width = 208;
			temp.x = 70;
			temp.y = 5;
			return temp;
		}

		private function topBar_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			topBar = temp;
			temp.name = "topBar";
			temp.x = 1;
			temp.y = -3;
			temp.elementsContent = [btn_i(),lb_i(),icon_i()];
			return temp;
		}

	}
}