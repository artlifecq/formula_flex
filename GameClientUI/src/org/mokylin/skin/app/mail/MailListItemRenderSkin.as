package org.mokylin.skin.app.mail
{
	import feathers.controls.text.Fontter;
	import feathers.themes.GuiThemeStyle;
	import feathers.controls.Check;
	import feathers.controls.Label;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.component.check.CheckBoxSkin_4;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class MailListItemRenderSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var bg:feathers.controls.UIAsset;

		public var bgIcon:feathers.controls.UIAsset;

		public var cbSelected:feathers.controls.Check;

		public var icon:feathers.controls.UIAsset;

		public var lbSenderName:feathers.controls.Label;

		public var lbStatus:feathers.controls.Label;

		public var lbTimes:feathers.controls.Label;

		public var lbTitle:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function MailListItemRenderSkin()
		{
			super();
			
			this.currentState = "normal";
			this.elementsContent = [bg_i(),bgIcon_i(),cbSelected_i(),lbSenderName_i(),lbTimes_i(),lbTitle_i(),lbStatus_i(),icon_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function bgIcon_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			bgIcon = temp;
			temp.name = "bgIcon";
			temp.styleName = "ui/common/grid/normal/46.png";
			temp.x = 6;
			temp.y = 2;
			return temp;
		}

		private function bg_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			bg = temp;
			temp.name = "bg";
			temp.height = 56;
			temp.styleName = "ui/common/kang/liebiao_di/liebiao_di.png";
			temp.width = 358;
			temp.x = 0;
			return temp;
		}

		private function cbSelected_i():feathers.controls.Check
		{
			var temp:feathers.controls.Check = new feathers.controls.Check();
			cbSelected = temp;
			temp.name = "cbSelected";
			temp.height = 20;
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.check.CheckBoxSkin_4);
			temp.width = 20;
			temp.x = 321;
			temp.y = 15;
			return temp;
		}

		private function icon_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			icon = temp;
			temp.name = "icon";
			temp.styleName = "ui/app/mail/icon_unread.png";
			temp.x = 9;
			temp.y = -1;
			return temp;
		}

		private function lbSenderName_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbSenderName = temp;
			temp.name = "lbSenderName";
			temp.height = 16;
			temp.text = "名字名字名字名字";
			temp.color = 0xDDDABA;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 146;
			temp.x = 85;
			temp.y = 6;
			return temp;
		}

		private function lbStatus_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbStatus = temp;
			temp.name = "lbStatus";
			temp.text = "标签";
			temp.color = 0xDDDABA;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 279;
			temp.y = 27;
			return temp;
		}

		private function lbTimes_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbTimes = temp;
			temp.name = "lbTimes";
			temp.bold = false;
			temp.height = 18;
			temp.fontSize = 14;
			temp.text = "剩余$天";
			temp.textAlign = "right";
			temp.color = 0x239D02;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 76;
			temp.x = 236;
			temp.y = 3;
			return temp;
		}

		private function lbTitle_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbTitle = temp;
			temp.name = "lbTitle";
			temp.height = 16;
			temp.text = "主题";
			temp.color = 0xDDDABA;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 189;
			temp.x = 85;
			temp.y = 27;
			return temp;
		}

	}
}