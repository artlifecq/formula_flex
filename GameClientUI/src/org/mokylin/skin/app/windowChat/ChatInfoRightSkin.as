package org.mokylin.skin.app.windowChat
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Label;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class ChatInfoRightSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var nickLab:feathers.controls.Label;

		public var textBg:feathers.controls.UIAsset;

		public var timeLab:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function ChatInfoRightSkin()
		{
			super();
			
			this.currentState = "normal";
			this.elementsContent = [textBg_i(),nickLab_i(),timeLab_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function nickLab_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			nickLab = temp;
			temp.name = "nickLab";
			temp.height = 20;
			temp.fontSize = 14;
			temp.text = "标签";
			temp.textAlign = "right";
			temp.color = 0xD69E66;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 97;
			temp.x = 241;
			temp.y = 2;
			return temp;
		}

		private function textBg_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			textBg = temp;
			temp.name = "textBg";
			temp.height = 52;
			temp.styleName = "ui/common/version_3/B_bujian/dui_hua_kuang_you.png";
			temp.width = 360;
			temp.x = 0;
			temp.y = 26;
			return temp;
		}

		private function timeLab_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			timeLab = temp;
			temp.name = "timeLab";
			temp.height = 20;
			temp.fontSize = 14;
			temp.text = "标签";
			temp.color = 0xD69E66;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 161;
			temp.x = 116;
			temp.y = 2;
			return temp;
		}

	}
}