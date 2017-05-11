package org.mokylin.skin.mainui.shortcut
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Button;
	import feathers.controls.Label;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.mainui.shortcut.button.ButtonChat;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class MessageChatIconSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var btn:feathers.controls.Button;

		public var numTxt:feathers.controls.Label;

		public var redPoint:feathers.controls.UIAsset;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function MessageChatIconSkin()
		{
			super();
			
			this.currentState = "normal";
			this.elementsContent = [btn_i(),redPoint_i(),numTxt_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function btn_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn = temp;
			temp.name = "btn";
			temp.styleClass = org.mokylin.skin.mainui.shortcut.button.ButtonChat;
			temp.x = 0;
			temp.y = 4;
			return temp;
		}

		private function numTxt_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			numTxt = temp;
			temp.name = "numTxt";
			temp.touchable = false;
			temp.text = "10";
			temp.textAlign = "center";
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 23;
			temp.y = -1;
			return temp;
		}

		private function redPoint_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			redPoint = temp;
			temp.name = "redPoint";
			temp.styleName = "ui/common/version_3/B_bujian/ti_shi_hong_di.png";
			temp.x = 25;
			temp.y = 3;
			return temp;
		}

	}
}