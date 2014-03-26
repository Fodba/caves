using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using umbraco.cms.businesslogic.web;
using umbraco.BusinessLogic;
using umbraco.NodeFactory;
using uComponents.Core;
using DigibizAdvancedMediaPicker;
using umbraco.cms.businesslogic.media;
using System.IO;
using Umbraco.Core.IO;
using umbraco.editorControls;
using umbraco.interfaces;
using System.Drawing;
using System.Drawing.Drawing2D;
using System.Drawing.Imaging;
using System.Xml;


/// <summary>
/// Description résumée de wsManagement
/// </summary>
[WebService(Namespace = "http://tempuri.org/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
// Pour autoriser l'appel de ce service Web depuis un script à l'aide d'ASP.NET AJAX, supprimez les marques de commentaire de la ligne suivante. 
// [System.Web.Script.Services.ScriptService]
public class wsManagement : System.Web.Services.WebService {

    public wsManagement () {

        //Supprimez les marques de commentaire dans la ligne suivante si vous utilisez des composants conçus 
        //InitializeComponent(); 
    }
    int ParentMediaID = 1147;
    User u = new umbraco.BusinessLogic.User(0);
    string _text = "";
    private int FindProduct(string ProductName, string ProductPath)
    {

        Node foundProduct = null;
       

        foreach (Node current in uQuery.GetNodesByName(ProductName))
        {
            string pathOfNames = "";
            if (current.Path.Contains("1147"))
            {
                foreach (string id in current.Path.Split(','))
                {
                    if (id != current.Id.ToString())
                    {
                        Node currentNode = new Node(Int32.Parse(id));
                        if (currentNode.NodeTypeAlias == "Product" || currentNode.NodeTypeAlias == "ProductCategory" || currentNode.NodeTypeAlias == "ProductCatalog")
                            pathOfNames += currentNode.Name + "|";
                    }
                }
                pathOfNames = pathOfNames.Remove(pathOfNames.Length - 1);
                if (pathOfNames == ProductPath)
                {
                    foundProduct = current;
                    break;
                }
            }
        }
        if (foundProduct != null)
            return foundProduct.Id;
        else
            return -1;

    }

    /// <summary>
    /// 
    /// </summary>
    /// <param name="ProductName">Nom du produit dont le stock va être mis à jour</param>
    /// <param name="ProductPath">Chemin dans l'arborescence jusqu'au produit. Pour l'instant, utiliser cette valeur : Catalog|Red wine</param>
    /// <param name="newValue">Nouvelle valeur de stock</param>
    [WebMethod]
    public void UpdateStock(string ProductName, string ProductPath, int newValue)
    {
        UpdateProduct(ProductName, ProductPath, "stock", newValue.ToString());
    }

    /// <summary>
    /// 
    /// </summary>
    /// <param name="ProductName">Nom du produit dont le nom va être mis à jour</param>
    /// <param name="ProductPath">Chemin dans l'arborescence jusqu'au produit. Pour l'instant, utiliser cette valeur : Catalog|Red wine</param>
    /// <param name="newValue">Nouvelle valeur de stock</param>
    [WebMethod]
    public void UpdateProductName(string ProductName, string ProductPath, string newValue)
    {
        UpdateProduct(ProductName, ProductPath, "name", newValue.ToString());
    }


    /// <summary>
    /// 
    /// </summary>
    /// <param name="ProductName">Nom du produit dont le SKU va être mis à jour</param>
    /// <param name="ProductPath">Chemin dans l'arborescence jusqu'au produit. Pour l'instant, utiliser cette valeur : Catalog|Red wine</param>
    /// <param name="newValue">Nouvelle valeur de SKU</param>
    [WebMethod]
    public void UpdateSKU(string ProductName, string ProductPath, string newValue)
    {
        UpdateProduct(ProductName, ProductPath, "sku", newValue.ToString());
    }

    /// <summary>
    /// 
    /// </summary>
    /// <param name="ProductName">Nom du produit dont la description va être mise à jour</param>
    /// <param name="ProductPath">Chemin dans l'arborescence jusqu'au produit. Pour l'instant, utiliser cette valeur : Catalog|Red wine</param>
    /// <param name="newValue">Nouvelle valeur de description</param>
    [WebMethod]
    public void UpdateDescription(string ProductName, string ProductPath, string newValue)
    {
        UpdateProduct(ProductName, ProductPath, "description", newValue.ToString());
    }

    /// <summary>
    /// 
    /// </summary>
    /// <param name="ProductName">Nom du produit dont le tarif va être mis à jour</param>
    /// <param name="ProductPath">Chemin dans l'arborescence jusqu'au produit. Pour l'instant, utiliser cette valeur : Catalog|Red wine</param>
    /// <param name="newValue">Nouvelle valeur de tarif</param>
    [WebMethod]
    public void UpdatePrice(string ProductName, string ProductPath, string newValue)
    {
        UpdateProduct(ProductName, ProductPath, "priceEURO", newValue.ToString());
    }
    /// <summary>
    /// 
    /// </summary>
    /// <param name="FileName">Nom du fichier à ajouter.Ex: "1250.jpg". Doit être présent dans le répertoir du site  /images_product</param>
    /// <param name="MediaName">Nom du média créé dans Teacommerce. Ex: "Pétrus Pomerol"</param>
    [WebMethod]
    public void CreateNewMediaWithName(string FileName,string MediaName)
    {
        NewMedia(FileName, MediaName);
    }
    /// <summary>
    /// 
    /// </summary>
    /// <param name="FileName">Nom du fichier à ajouter. Ex : "4059.jpg"</param>
    [WebMethod]
    public void CreateNewMedia(string FileName)
    {
        NewMedia(FileName, "");
    }

    private void NewMedia(string FileName, string MediaName)
    {
        UmbracoSave(FileName, MediaName);
    }


    private void UpdateProduct(string ProductName, string ProductPath, string paramToUpdate, string value)
    {
        //sku, priceEURO,image,description, name, masterRelation
       int productId= FindProduct(ProductName, ProductPath);
       if (productId >= 0)
       {
           Document product = new Document(productId);
           product.getProperty(paramToUpdate).Value = value;
           product.SaveAndPublish(u);
           umbraco.library.UpdateDocumentCache(product.Id);
       }
    }

    private void UpdateProduct(int ProductID, string paramToUpdate, string value)
    {
        //sku, priceEURO,image,description, name, masterRelation
        int productId = ProductID;
        if (productId >= 0)
        {
            Document product = new Document(productId);
            product.getProperty(paramToUpdate).Value = value;
            product.SaveAndPublish(u);
            umbraco.library.UpdateDocumentCache(product.Id);
        }
    }


   
    public void CreateProductInShop(string ProductName, int ProductID, string ProductPah)
    {
        DocumentType typeOfProduct = DocumentType.GetByAlias("Product");
        Document product = Document.MakeNew(ProductName, typeOfProduct, u, ProductID);

        //sku, priceEURO,image,description, name, masterRelation
        product.SaveAndPublish(u);
        umbraco.library.UpdateDocumentCache(product.Id);

    }

    /// <summary>
    /// 
    /// </summary>
    /// <param name="ProductName"></param>
    /// <param name="ProductPath">Chemin dans l'arborescence jusqu'au produit. Pour l'instant, utiliser cette valeur : Catalog|Red wine</param>
    /// <param name="SKU"></param>
    /// <param name="Price"></param>
    /// <param name="Description"></param>
    /// <param name="Stock"></param>
    [WebMethod]
    public void CreateNewProduct(string ProductName, string ProductPath,string SKU, string Price, string Description, string Stock)
    {
        DocumentType typeOfProduct = DocumentType.GetByAlias("Product");
        
        Node foundProduct = null;

        string productToAdd = ProductPath.Split('|')[ProductPath.Split('|').Length - 1];

        foreach (Node current in uQuery.GetNodesByName(productToAdd))
        {
            string pathOfNames = "";
            if (current.Path.Contains("1147"))
            {
                foreach (string id in current.Path.Split(','))
                {
                    Node currentNode = new Node(Int32.Parse(id));
                    if (currentNode.NodeTypeAlias == "Product" || currentNode.NodeTypeAlias == "ProductCategory" || currentNode.NodeTypeAlias == "ProductCatalog")
                        pathOfNames += currentNode.Name + "|";

                }
                pathOfNames = pathOfNames.Remove(pathOfNames.Length - 1);
                if (pathOfNames == ProductPath)
                {
                    foundProduct = current;
                    break;
                }
            }
        }
        if (foundProduct != null)
        {
            if (FindProduct(ProductName, ProductPath) < 0)
            {
                Document product = Document.MakeNew(ProductName, typeOfProduct, u, foundProduct.Id);
             
                //sku, priceEURO,image,description, name, masterRelation
                product.SaveAndPublish(u);
                umbraco.library.UpdateDocumentCache(product.Id);
                UpdateProduct(product.Id, "sku", SKU);
                UpdateProduct(product.Id, "name", ProductName);
                UpdateProduct(product.Id, "priceEURO", Price);
                UpdateProduct(product.Id, "description", Description);
                UpdateProduct(product.Id, "sku", SKU);
                UpdateProduct(product.Id, "stock", Stock);

            }
        }
    }

    private Media UmbracoSave(string FileName)
    {
        return UmbracoSave(FileName, "");
    }

    private Media UmbracoSave(string PhysicalName, string FileName)
    {
        string mediaPath = "";
        Media m = null;

        if (PhysicalName != "")
        {
            // Find filename
            _text = PhysicalName;
            string filename;
            string _fullFilePath;

            filename = FileName != "" ? FileName : _text.Substring(_text.LastIndexOf("\\") + 1, _text.Length - _text.LastIndexOf("\\") - 1).ToLower();

            // create the Media Node
            // TODO:  get parent id for current category - as selected by user (see below)
            // - for now just stick these in the media root :: node = -1
            m = Media.MakeNew(
                filename, MediaType.GetByAlias("image"), u, 1244);

            // Create a new folder in the /media folder with the name /media/propertyid
            string mediaRootPath = HttpContext.GetGlobalResourceObject("AppSettings", "MediaFilePath")!=null && HttpContext.GetGlobalResourceObject("AppSettings", "MediaFilePath")!="" ? HttpContext.GetGlobalResourceObject("AppSettings", "MediaFilePath") as string : "\\media"; // get path from App_GlobalResources
            string originPath = Server.MapPath("~/images_product/" + PhysicalName);
            string storagePath = Server.MapPath("~"+mediaRootPath)+"\\" + m.Id.ToString();
            System.IO.Directory.CreateDirectory(storagePath);
            _fullFilePath = storagePath + "\\" + PhysicalName;
            File.Copy(originPath, _fullFilePath);

            // Save extension
            string orgExt = PhysicalName.Substring(PhysicalName.LastIndexOf(".") + 1, PhysicalName.Length - PhysicalName.LastIndexOf(".") - 1);
            orgExt = orgExt.ToLower();
            string ext = orgExt.ToLower();
            try
            {
                m.getProperty("umbracoExtension").Value = ext;
            }
            catch { }

            // Save file size
            try
            {
                System.IO.FileInfo fi = new FileInfo(_fullFilePath);
                m.getProperty("umbracoBytes").Value = fi.Length.ToString();
            }
            catch { }

            // Check if image and then get sizes, make thumb and update database
            if (",jpeg,jpg,gif,bmp,png,tiff,tif,".IndexOf("," + ext + ",") > 0)
            {
                int fileWidth;
                int fileHeight;

                FileStream fs = new FileStream(_fullFilePath,FileMode.Open, FileAccess.Read, FileShare.Read);

                System.Drawing.Image image = System.Drawing.Image.FromStream(fs);
                fileWidth = image.Width;
                fileHeight = image.Height;
                fs.Close();
                try
                {
                    m.getProperty("umbracoWidth").Value = fileWidth.ToString();
                    m.getProperty("umbracoHeight").Value = fileHeight.ToString();
                }
                catch { }

                // Generate thumbnails
                string fileNameThumb = _fullFilePath.Replace("." + orgExt, "_thumb");
                generateThumbnail(image, 100, fileWidth, fileHeight, _fullFilePath, ext, fileNameThumb + ".jpg");

                image.Dispose();
            }
            mediaPath = "/media/" + m.Id.ToString() + "/" + PhysicalName;

            m.getProperty("umbracoFile").Value = mediaPath;
            m.Save();
            umbraco.library.ClearLibraryCacheForMedia(m.Id);
            m.XmlGenerate(new XmlDocument());
        }
        // return the media...
        return m;
    }

    protected void generateThumbnail(System.Drawing.Image image, int maxWidthHeight, int fileWidth, int fileHeight, string fullFilePath, string ext, string thumbnailFileName)
    {
        // Generate thumbnail
        float fx = (float)fileWidth / (float)maxWidthHeight;
        float fy = (float)fileHeight / (float)maxWidthHeight;
        // must fit in thumbnail size
        float f = Math.Max(fx, fy); //if (f < 1) f = 1;
        int widthTh = (int)Math.Round((float)fileWidth / f); int heightTh = (int)Math.Round((float)fileHeight / f);

        // fixes for empty width or height
        if (widthTh == 0)
            widthTh = 1;
        if (heightTh == 0)
            heightTh = 1;

        // Create new image with best quality settings
        Bitmap bp = new Bitmap(widthTh, heightTh);
        Graphics g = Graphics.FromImage(bp);
        g.SmoothingMode = SmoothingMode.HighQuality;
        g.InterpolationMode = InterpolationMode.HighQualityBicubic;
        g.PixelOffsetMode = PixelOffsetMode.HighQuality;

        // Copy the old image to the new and resized
        Rectangle rect = new Rectangle(0, 0, widthTh, heightTh);
        g.DrawImage(image, rect, 0, 0, image.Width, image.Height, GraphicsUnit.Pixel);

        // Copy metadata
        ImageCodecInfo[] codecs = ImageCodecInfo.GetImageEncoders();
        ImageCodecInfo codec = null;
        for (int i = 0; i < codecs.Length; i++)
        {
            if (codecs[i].MimeType.Equals("image/jpeg"))
                codec = codecs[i];
        }

        // Set compresion ratio to 90%
        EncoderParameters ep = new EncoderParameters();
        ep.Param[0] = new EncoderParameter(Encoder.Quality, 90L);

        // Save the new image
        bp.Save(thumbnailFileName, codec, ep);
        bp.Dispose();
        g.Dispose();

    }


}
