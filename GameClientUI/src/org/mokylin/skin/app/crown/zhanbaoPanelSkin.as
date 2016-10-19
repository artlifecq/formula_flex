package org.mokylin.skin.app.crown
{
	import feathers.controls.text.Fontter;
	import feathers.data.ListCollection;
	import feathers.controls.Button;
	import feathers.controls.Label;
	import feathers.controls.List;
	import feathers.controls.StateSkin;
	import feathers.controls.TabBar;
	import feathers.controls.UIAsset;
	import feathers.layout.HorizontalLayout;
	import feathers.layout.VerticalLayout;
	import org.mokylin.skin.component.button.ButtonSkin_close_3;
	import org.mokylin.skin.component.list.EquipListSkin;
	import org.mokylin.skin.mainui.chat.button.ButtonSkin_channel;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class zhanbaoPanelSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var __zhanbaoPanelSkin_HorizontalLayout1:feathers.layout.HorizontalLayout;

		public var closeBtn:feathers.controls.Button;

		public var list:feathers.controls.List;

		public var tabBar:feathers.controls.TabBar;

		public var title:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function zhanbaoPanelSkin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 265;
			this.width = 396;
			this.elementsContent = [__zhanbaoPanelSkin_UIAsset1_i(),tabBar_i(),__zhanbaoPanelSkin_UIAsset2_i(),closeBtn_i(),title_i(),list_i()];
			
			states = {
				init:[
						{target:"__zhanbaoPanelSkin_HorizontalLayout1",
							name:"paddingLeft",
							value:2
						}
					]
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __zhanbaoPanelSkin_ArrayCollection1_i():feathers.data.ListCollection
		{
			var temp:feathers.data.ListCollection = new feathers.data.ListCollection();
			temp.data = ['全部','活跃','官员','镖车'];
			return temp;
		}

		private function __zhanbaoPanelSkin_HorizontalLayout1_i():feathers.layout.HorizontalLayout
		{
			var temp:feathers.layout.HorizontalLayout = new feathers.layout.HorizontalLayout();
			__zhanbaoPanelSkin_HorizontalLayout1 = temp;
			temp.paddingRight = 2;
			return temp;
		}

		private function __zhanbaoPanelSkin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 265;
			temp.styleName = "ui/common/backgound/sanjimianban.png";
			temp.width = 395;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function __zhanbaoPanelSkin_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.touchGroup = false;
			temp.touchable = false;
			temp.styleName = "ui/common/kang/xiaotaitou.png";
			temp.y = 3;
			return temp;
		}

		private function __zhanbaoPanelSkin_VerticalLayout1_i():feathers.layout.VerticalLayout
		{
			var temp:feathers.layout.VerticalLayout = new feathers.layout.VerticalLayout();
			temp.gap = 4;
			return temp;
		}

		private function closeBtn_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			closeBtn = temp;
			temp.name = "closeBtn";
			temp.height = 24;
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_close_3;
			temp.width = 24;
			temp.x = 369;
			temp.y = 1;
			return temp;
		}

		private function list_i():feathers.controls.List
		{
			var temp:feathers.controls.List = new feathers.controls.List();
			list = temp;
			temp.name = "list";
			temp.height = 200;
			temp.styleClass = org.mokylin.skin.component.list.EquipListSkin;
			temp.width = 385;
			temp.x = 4;
			temp.y = 55;
			temp.layout = __zhanbaoPanelSkin_VerticalLayout1_i();
			return temp;
		}

		private function tabBar_i():feathers.controls.TabBar
		{
			var temp:feathers.controls.TabBar = new feathers.controls.TabBar();
			tabBar = temp;
			temp.name = "tabBar";
			temp.height = 26;
			temp.styleClass = org.mokylin.skin.mainui.chat.button.ButtonSkin_channel;
			temp.width = 378;
			temp.x = 5;
			temp.y = 29;
			temp.layout = __zhanbaoPanelSkin_HorizontalLayout1_i();
			temp.dataProvider = __zhanbaoPanelSkin_ArrayCollection1_i();
			return temp;
		}

		private function title_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			title = temp;
			temp.name = "title";
			temp.height = 26;
			temp.touchGroup = false;
			temp.touchable = false;
			temp.fontSize = 18;
			temp.text = "战 报";
			temp.textAlign = "center";
			temp.color = 0xDDDABA;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 175;
			temp.x = 117;
			temp.y = 1;
			return temp;
		}

	}
}