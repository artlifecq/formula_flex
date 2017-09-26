package org.mokylin.skin.app.msg
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Group;
	import feathers.controls.Label;
	import feathers.controls.SkinnableContainer;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.app.msg.Arrows;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class ArrowRightSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var arrow:feathers.controls.SkinnableContainer;

		public var gText:feathers.controls.Group;

		public var lbName:feathers.controls.Label;

		public var line:feathers.controls.UIAsset;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function ArrowRightSkin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 1;
			this.width = 1;
			this.elementsContent = [gText_i(),arrow_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __ArrowRightSkin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/mainui/msg/kuang.png";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function arrow_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			arrow = temp;
			temp.name = "arrow";
			temp.height = 1;
			temp.scaleX = -1;
			var skin:StateSkin = new org.mokylin.skin.app.msg.Arrows()
			temp.skin = skin
			temp.width = 1;
			temp.x = -25;
			temp.y = 0;
			return temp;
		}

		private function gText_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			gText = temp;
			temp.name = "gText";
			temp.x = -247;
			temp.y = -32;
			temp.elementsContent = [__ArrowRightSkin_UIAsset1_i(),line_i(),lbName_i()];
			return temp;
		}

		private function lbName_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbName = temp;
			temp.name = "lbName";
			temp.fontSize = 18;
			temp.text = "点击继续";
			temp.textAlign = "center";
			temp.color = 0xFFCE58;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlue2"];
			temp.width = 166;
			temp.x = 15;
			temp.y = 20;
			return temp;
		}

		private function line_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			line = temp;
			temp.name = "line";
			temp.styleName = "ui/mainui/msg/kuangwaifaguang.png";
			temp.x = 1;
			temp.y = 1;
			return temp;
		}

	}
}