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
	public class TabBtnSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var __TabBtnSkin_UIAsset1:feathers.controls.UIAsset;

		public var __TabBtnSkin_UIAsset2:feathers.controls.UIAsset;

		public var __TabBtnSkin_UIAsset3:feathers.controls.UIAsset;

		public var __TabBtnSkin_UIAsset4:feathers.controls.UIAsset;

		public var labelDisplay:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function TabBtnSkin()
		{
			super();
			
			this.currentState = "up";
			this.height = 24;
			this.width = 65;
			this.elementsContent = [labelDisplay_i()];
			__TabBtnSkin_UIAsset1_i();
			__TabBtnSkin_UIAsset2_i();
			__TabBtnSkin_UIAsset3_i();
			__TabBtnSkin_UIAsset4_i();
			
			
			states = {
				up:[
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
					]
				,
				hover:[
						{target:"labelDisplay",
							name:"y",
							value:3
						}
					]
				,
				down:[
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
					]
			};
			skinNames={"down":"ui/component/tabbar/skin_1/down.png",
			"downAndSelected":"ui/component/tabbar/skin_1/select.png",
			"hover":"ui/component/tabbar/skin_1/over.png",
			"overAndSelected":"ui/component/tabbar/skin_1/select.png",
			"up":"ui/component/tabbar/skin_1/up.png",
			"upAndSelected":"ui/component/tabbar/skin_1/select.png"};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __TabBtnSkin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			__TabBtnSkin_UIAsset1 = temp;
			temp.styleName = "ui/component/tabbar/skin_1/up.png";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function __TabBtnSkin_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			__TabBtnSkin_UIAsset2 = temp;
			temp.styleName = "ui/component/tabbar/skin_1/over.png";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function __TabBtnSkin_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			__TabBtnSkin_UIAsset3 = temp;
			temp.styleName = "ui/component/tabbar/skin_1/down.png";
			temp.x = 1;
			temp.y = 1;
			return temp;
		}

		private function __TabBtnSkin_UIAsset4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			__TabBtnSkin_UIAsset4 = temp;
			temp.styleName = "ui/component/tabbar/skin_1/select.png";
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
			temp.textAlign = "center";
			temp.color = 0xFFFFFF;
			temp.width = 56;
			temp.x = 0;
			temp.y = 3;
			return temp;
		}

	}
}