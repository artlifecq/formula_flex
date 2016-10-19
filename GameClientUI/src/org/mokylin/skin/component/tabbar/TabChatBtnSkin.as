package org.mokylin.skin.component.tabbar
{
	import feathers.controls.Label;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class TabChatBtnSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var __TabChatBtnSkin_UIAsset1:feathers.controls.UIAsset;

		public var __TabChatBtnSkin_UIAsset2:feathers.controls.UIAsset;

		public var __TabChatBtnSkin_UIAsset3:feathers.controls.UIAsset;

		public var __TabChatBtnSkin_UIAsset4:feathers.controls.UIAsset;

		public var labelDisplay:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function TabChatBtnSkin()
		{
			super();
			
			this.currentState = "up";
			this.height = 24;
			this.width = 65;
			this.elementsContent = [labelDisplay_i()];
			__TabChatBtnSkin_UIAsset1_i();
			__TabChatBtnSkin_UIAsset2_i();
			__TabChatBtnSkin_UIAsset3_i();
			__TabChatBtnSkin_UIAsset4_i();
			
			
			states = {
				down:[
						{target:"__TabChatBtnSkin_UIAsset3",
							propertyName:"",
							position:"before",
							relativeTo:"labelDisplay"
						}
						,
						{target:"labelDisplay",
							name:"y",
							value:3
						}
						,
						{target:"labelDisplay",
							name:"width",
							value:47
						}
						,
						{target:"labelDisplay",
							name:"x",
							value:3
						}
						,
						{target:"",
							name:"width",
							value:65
						}
						,
						{target:"",
							name:"height",
							value:26
						}
					]
				,
				up:[
						{target:"__TabChatBtnSkin_UIAsset1",
							propertyName:"",
							position:"before",
							relativeTo:"labelDisplay"
						}
						,
						{target:"labelDisplay",
							name:"y",
							value:3
						}
						,
						{target:"labelDisplay",
							name:"width",
							value:49
						}
						,
						{target:"labelDisplay",
							name:"x",
							value:0
						}
						,
						{target:"",
							name:"width",
							value:65
						}
						,
						{target:"",
							name:"height",
							value:26
						}
					]
				,
				hover:[
						{target:"__TabChatBtnSkin_UIAsset2",
							propertyName:"",
							position:"before",
							relativeTo:"labelDisplay"
						}
						,
						{target:"labelDisplay",
							name:"y",
							value:3
						}
						,
						{target:"",
							name:"width",
							value:65
						}
						,
						{target:"",
							name:"height",
							value:26
						}
					]
				,
				upAndSelected:[
						{target:"__TabChatBtnSkin_UIAsset4",
							propertyName:"",
							position:"before",
							relativeTo:"labelDisplay"
						}
						,
						{target:"",
							name:"width",
							value:65
						}
						,
						{target:"",
							name:"height",
							value:26
						}
					]
				,
				hoverAndSelected:[
						{target:"__TabChatBtnSkin_UIAsset4",
							propertyName:"",
							position:"before",
							relativeTo:"labelDisplay"
						}
						,
						{target:"",
							name:"width",
							value:65
						}
						,
						{target:"",
							name:"height",
							value:26
						}
					]
				,
				downAndSelected:[
						{target:"__TabChatBtnSkin_UIAsset4",
							propertyName:"",
							position:"before",
							relativeTo:"labelDisplay"
						}
						,
						{target:"",
							name:"width",
							value:65
						}
						,
						{target:"",
							name:"height",
							value:26
						}
					]
				,
				init:[
						{target:"labelDisplay",
							name:"align",
							value:"center"
						}
						,
						{target:"labelDisplay",
							name:"color",
							value:0xFFFFFF
						}
					]
			};
			skinNames={upAndSelected:"ui/component/tabbar/skin_chat/select.png",	down:"ui/component/tabbar/skin_chat/down.png",	downAndSelected:"ui/component/tabbar/skin_chat/select.png",	hover:"ui/component/tabbar/skin_chat/over.png",	hoverAndSelected:"ui/component/tabbar/skin_chat/select.png",	up:"ui/component/tabbar/skin_chat/up.png"};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __TabChatBtnSkin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			__TabChatBtnSkin_UIAsset1 = temp;
			temp.styleName = "ui/component/tabbar/skin_chat/up.png";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function __TabChatBtnSkin_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			__TabChatBtnSkin_UIAsset2 = temp;
			temp.styleName = "ui/component/tabbar/skin_chat/over.png";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function __TabChatBtnSkin_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			__TabChatBtnSkin_UIAsset3 = temp;
			temp.styleName = "ui/component/tabbar/skin_chat/down.png";
			temp.x = 1;
			temp.y = 1;
			return temp;
		}

		private function __TabChatBtnSkin_UIAsset4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			__TabChatBtnSkin_UIAsset4 = temp;
			temp.styleName = "ui/component/tabbar/skin_chat/select.png";
			temp.x = -1;
			temp.y = -1;
			return temp;
		}

		private function labelDisplay_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labelDisplay = temp;
			temp.name = "labelDisplay";
			temp.height = 22;
			temp.text = "标签";
			temp.width = 56;
			temp.x = 0;
			temp.y = 3;
			return temp;
		}

	}
}