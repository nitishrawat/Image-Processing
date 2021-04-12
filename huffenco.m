function [encoded,dict] = huffenco(image)

[width,heigth]=size(image);
image=round(image);
image_array = reshape(image,1,width*heigth);
symbols = unique(image_array);

count = zeros(1,length(symbols));
prob = zeros(1,length(symbols));
for i=1:length(image_array)
    for j=1:length(symbols)
        if image_array(i)==symbols(j)
            count(j) = count(j) + 1;
            prob(j) = count(j)/(width*heigth);
            break;
        end
    end
end

[dict,avglen] = huffmandict(symbols,prob); % Create dictionary.
encoded = huffmanenco(image_array,dict); % Encode the data.
end
