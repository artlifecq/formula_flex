package org.mokylin.skin.mainui.chat
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
	public class pingdaoItems extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var __pingdaoItems_UIAsset1:feathers.controls.UIAsset;

		public var __pingdaoItems_UIAsset2:feathers.controls.UIAsset;

		public var __pingdaoItems_UIAsset3:feathers.controls.UIAsset;

		public var iconDisplay:feathers.controls.UIAsset;

		public var labelDisplay:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function pingdaoItems()
		{
			super();
			
			this.currentState = "down";
			this.height = 18;
			this.width = 41;
			this.elementsContent = [labelDisplay_i(),iconDisplay_i()];
			__pingdaoItems_UIAsset1_i();
			__pingdaoItems_UIAsset2_i();
			__pingdaoItems_UIAsset3_i();
			
			
			states = {
				down:[
						{target:"labelDisplay",
							name:"color",
							value:0x868276
						}
						,
						{target:"labelDisplay",
							name:"width",
							value:40
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
							name:"color",
							value:0xcfc6ae
						}
						,
						{target:"labelDisplay",
							name:"width",
							value:40
						}
						,
						{target:"labelDisplay",
							name:"x",
							value:0
						}
					]
				,
				up:[
						{target:"labelDisplay",
							name:"color",
							value:0x8b8d7b
						}
						,
						{target:"labelDisplay",
							name:"x",
							value:0
						}
						,
						{target:"labelDisplay",
							name:"width",
							value:40
						}
						,
						{target:"labelDisplay",
							name:"height",
							value:20
						}
						,
						{target:"labelDisplay",
							name:"y",
							value:0
						}
					]
			};
			skinNames={"down":"ui/mainui/chat/pingdao_di.png", "hover":"ui/mainui/chat/pingdao_di.png", "up":"ui/mainui/chat/pingdao_di.png"};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __pingdaoItems_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			__pingdaoItems_UIAsset1 = temp;
			temp.alpha = 1;
			temp.height = 18;
			temp.styleName = "ui/mainui/chat/pingdao_di.png";
			temp.width = 41;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function __pingdaoItems_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			__pingdaoItems_UIAsset2 = temp;
			temp.height = 18;
			temp.styleName = "ui/mainui/chat/pingdao_di.png";
			temp.width = 41;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function __pingdaoItems_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			__pingdaoItems_UIAsset3 = temp;
			temp.height = 18;
			temp.styleName = "ui/mainui/chat/pingdao_di.png";
			temp.width = 41;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function iconDisplay_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			iconDisplay = temp;
			temp.name = "iconDisplay";
			return temp;
		}

		private function labelDisplay_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labelDisplay = temp;
			temp.name = "labelDisplay";
			temp.height = 20;
			temp.text = "文本";
			temp.textAlign = "center";
			temp.color = 0x8b8d7b;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.verticalAlign = "middle";
			temp.verticalCenter = -3;
			temp.width = 40;
			temp.x = 0;
			temp.y = -2;
			return temp;
		}

	}
}