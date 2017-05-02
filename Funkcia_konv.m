function [ image ] = Funkcia_konv( img,matrix,rozsah )
  [rows cols] = size(img)
  G=floor(rozsah/2);
  %// New - Create a padded matrix that is the same class as the input
  new_img = zeros((rows+(2*G)),(cols+(2*G)));
  new_img = cast(new_img, class(img));

  %// New -  Place original image in padded result
  new_img((G+1):end-G,(G+1):end-G) = img;

  %// Also create new output image the same size as the padded result
  image = zeros(size(new_img));
  image = cast(image, class(img));

  for i=(G+1):1:rows+G
    for j=(G+1):1:cols+G 
      value=0;
      for g=-G:1:G
        for l=-G:1:G
          value=value+new_img(i+g,j+l)*matrix(g+(G+1),l+(G+1)); %// Change
        end
      end
     image(i,j)=value;
    end
  end

image = image((G+1):end-G,(G+1):end-G);
end