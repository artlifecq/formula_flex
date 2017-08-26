package org.mokylin.skin.common
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
	public class erjiItem_Skin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var labelDisplay:feathers.controls.Label;

		public var uiBg:feathers.controls.UIAsset;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function erjiItem_Skin()
		{
			super();
			
			this.currentState = "down";
			this.height = 20;
			this.width = 60;
			this.elementsContent = [uiBg_i(),labelDisplay_i()];
			
			states = {
				down:[
						{target:"labelDisplay",
							name:"width",
							value:60
						}
						,
						{target:"labelDisplay",
							name:"horizontalCenter",
							value:0
						}
						,
						{target:"labelDisplay",
							name:"height",
							value:18
						}
					]
				,
				hover:[
						{target:"labelDisplay",
							name:"width",
							value:60
						}
						,
						{target:"labelDisplay",
							name:"horizontalCenter",
							value:0
						}
						,
						{target:"labelDisplay",
							name:"height",
							value:18
						}
					]
				,
				up:[
						{target:"labelDisplay",
							name:"width",
							value:60
						}
						,
						{target:"labelDisplay",
							name:"height",
							value:18
						}
						,
						{target:"labelDisplay",
							name:"y",
							value:0
						}
						,
						{target:"labelDisplay",
							name:"horizontalCenter",
							value:0
						}
					]
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function labelDisplay_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labelDisplay = temp;
			temp.name = "labelDisplay";
			temp.height = 20;
			temp.text = "使用";
			temp.textAlign = "center";
			temp.color = 0xEAEABC;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.verticalAlign = "middle";
			temp.width = 60;
			temp.y = 0;
			return temp;
		}

		private function uiBg_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiBg = temp;
			temp.name = "uiBg";
			temp.alpha = 0.8;
			temp.height = 20;
			temp.left = 0;
			temp.styleName = "ui/common/tips/xialatiaoditu.png";
			temp.width = 60;
			temp.y = 0;
			return temp;
		}

	}
}