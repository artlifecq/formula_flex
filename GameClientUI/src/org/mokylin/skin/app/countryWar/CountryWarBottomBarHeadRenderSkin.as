package org.mokylin.skin.app.countryWar
{
	import feathers.controls.Button;
	import feathers.controls.ProgressBar;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.component.button.ButtonSkin_mount_btn_right;
	import org.mokylin.skin.component.progress.ProgressBarSKin_hp1Skin;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class CountryWarBottomBarHeadRenderSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var btnUnfold:feathers.controls.Button;

		public var imageBar:feathers.controls.UIAsset;

		public var imageFrame:feathers.controls.UIAsset;

		public var imageTextName:feathers.controls.UIAsset;

		public var imageTextStatus:feathers.controls.UIAsset;

		public var pbHp:feathers.controls.ProgressBar;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function CountryWarBottomBarHeadRenderSkin()
		{
			super();
			
			this.currentState = "normal";
			this.elementsContent = [imageBar_i(),btnUnfold_i(),imageFrame_i(),imageTextStatus_i(),imageTextName_i(),pbHp_i()];
			
			states = {
				init:[
						{target:"pbHp",
							name:"paddingLeft",
							value:1
						}
					]
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function btnUnfold_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnUnfold = temp;
			temp.name = "btnUnfold";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_mount_btn_right;
			temp.x = 70;
			temp.y = 66;
			return temp;
		}

		private function imageBar_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			imageBar = temp;
			temp.name = "imageBar";
			temp.styleName = "ui/app/countryWar/jin_du_di.png";
			temp.width = 75;
			temp.x = 14;
			temp.y = 70;
			return temp;
		}

		private function imageFrame_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			imageFrame = temp;
			temp.name = "imageFrame";
			temp.styleName = "ui/app/countryWar/jue_se_di_2.png";
			temp.x = 0;
			temp.y = 36;
			return temp;
		}

		private function imageTextName_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			imageTextName = temp;
			temp.name = "imageTextName";
			temp.styleName = "ui/app/countryWar/text_bian_jin_1.png";
			temp.x = 8;
			temp.y = 57;
			return temp;
		}

		private function imageTextStatus_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			imageTextStatus = temp;
			temp.name = "imageTextStatus";
			temp.styleName = "ui/app/countryWar/text_po.png";
			temp.x = 9;
			temp.y = 13;
			return temp;
		}

		private function pbHp_i():feathers.controls.ProgressBar
		{
			var temp:feathers.controls.ProgressBar = new feathers.controls.ProgressBar();
			pbHp = temp;
			temp.name = "pbHp";
			temp.height = 6;
			temp.paddingRight = 1;
			temp.styleClass = org.mokylin.skin.component.progress.ProgressBarSKin_hp1Skin;
			temp.width = 69;
			temp.x = 0;
			temp.y = -26;
			return temp;
		}

	}
}